locals {
  talos_control_plane_ips = [for i in range(var.control_plane_count) : format(var.network_ipv4_prefix, i + 1)]
  talos_worker_ips        = [for i in range(var.worker_count) : format(var.network_ipv4_prefix, i + 4)]
}

# --- talos

data "http" "talos_schematic_id" {
  url          = "https://factory.talos.dev/schematics"
  method       = "POST"
  request_body = var.talos_schematic
}

data "talos_image_factory_urls" "this" {
  talos_version = var.talos_version
  schematic_id  = jsondecode(data.http.talos_schematic_id.response_body)["id"]
  platform      = "nocloud"
  architecture  = "amd64"
}

resource "talos_machine_secrets" "this" {
  talos_version = var.talos_version
}

data "talos_machine_configuration" "control_plane" {
  talos_version      = var.talos_version
  kubernetes_version = var.talos_kubernetes_version

  cluster_name     = var.cluster_name
  cluster_endpoint = "https://${var.cluster_endpoint}:6443"

  machine_type    = "controlplane"
  machine_secrets = talos_machine_secrets.this.machine_secrets
}

data "talos_machine_configuration" "worker" {
  talos_version      = var.talos_version
  kubernetes_version = var.talos_kubernetes_version

  cluster_name     = var.cluster_name
  cluster_endpoint = "https://${var.cluster_vip}:6443"

  machine_type    = "worker"
  machine_secrets = talos_machine_secrets.this.machine_secrets
}

data "talos_client_configuration" "this" {
  client_configuration = talos_machine_secrets.this.client_configuration

  cluster_name = var.cluster_name

  endpoints = local.talos_control_plane_ips
}

resource "proxmox_virtual_environment_download_file" "talos_image" {
  node_name    = "pve-01"
  datastore_id = "local"

  url          = replace(data.talos_image_factory_urls.this.urls.disk_image, "xz", "gz")
  file_name    = "talos-${var.talos_version}-nocloud-amd64.img"
  content_type = "iso"

  decompression_algorithm = "gz"
  overwrite               = false
}

# --- control plane

module "control_plane" {
  source = "./modules/virtual-machine"

  count = var.control_plane_count

  id    = 1000 + count.index + 1
  name  = "${var.control_plane_prefix}${count.index + 1}"
  order = count.index + 1

  datastore = "data"
  node      = "pve-01"

  cores  = var.control_plane_cores
  memory = var.control_plane_memory

  storage     = var.control_plane_storage
  storage_bus = "scsi"

  ipv4_address = "${local.talos_control_plane_ips[count.index]}/24"
  ipv4_gateway = var.network_gateway

  dns_servers = [var.network_dns_server]
  dns_domain  = var.network_dns_domain

  image = proxmox_virtual_environment_download_file.talos_image.id

  tags = ["talos"]
}

resource "talos_machine_configuration_apply" "control_plane" {
  count = var.control_plane_count

  node = local.talos_control_plane_ips[count.index]

  apply_mode = "staged_if_needing_reboot"

  client_configuration        = talos_machine_secrets.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.control_plane.machine_configuration

  config_patches = [
    templatefile("${path.module}/templates/control-plane.yaml.tftpl", {
      install_disk  = "/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi0"
      install_image = data.talos_image_factory_urls.this.urls.installer
      ipv4_address  = local.talos_control_plane_ips[count.index]
      cluster_vip   = var.cluster_vip
      hostname      = "${var.control_plane_prefix}${count.index + 1}"
    })
  ]

  depends_on = [
    module.control_plane,
  ]
}

# --- worker

module "worker" {
  source = "./modules/virtual-machine"

  count = var.worker_count

  id    = 1000 + count.index + 4
  name  = "${var.worker_prefix}${count.index + 1}"
  order = count.index + 4

  datastore = "data"
  node      = "pve-01"

  cores  = var.worker_cores
  memory = var.worker_memory

  storage     = var.worker_storage
  storage_bus = "virtio"

  ipv4_address = "${local.talos_worker_ips[count.index]}/24"
  ipv4_gateway = var.network_gateway

  dns_servers = [var.network_dns_server]
  dns_domain  = var.network_dns_domain

  image = proxmox_virtual_environment_download_file.talos_image.id

  tags = ["talos"]
}

resource "talos_machine_configuration_apply" "worker" {
  count = var.worker_count

  node = local.talos_worker_ips[count.index]

  apply_mode = "staged_if_needing_reboot"

  client_configuration        = talos_machine_secrets.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.worker.machine_configuration

  config_patches = [
    templatefile("${path.root}/templates/worker.yaml.tftpl", {
      install_image = data.talos_image_factory_urls.this.urls.installer
      ipv4_address  = local.talos_worker_ips[count.index]
      hostname      = "${var.worker_prefix}${count.index + 1}"
    })
  ]

  depends_on = [
    module.worker,
  ]
}

# --- bootstrap talos

resource "talos_machine_bootstrap" "this" {
  client_configuration = talos_machine_secrets.this.client_configuration

  node = local.talos_control_plane_ips[0]

  depends_on = [
    talos_machine_configuration_apply.control_plane,
  ]
}

data "talos_cluster_health" "this" {
  client_configuration = data.talos_client_configuration.this.client_configuration

  endpoints           = data.talos_client_configuration.this.endpoints
  control_plane_nodes = local.talos_control_plane_ips
  worker_nodes        = local.talos_worker_ips

  skip_kubernetes_checks = true

  depends_on = [
    talos_machine_bootstrap.this,
  ]
}

resource "talos_cluster_kubeconfig" "this" {
  client_configuration = talos_machine_secrets.this.client_configuration

  node = local.talos_control_plane_ips[0]

  depends_on = [
    data.talos_cluster_health.this,
  ]
}
