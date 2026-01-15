resource "proxmox_virtual_environment_download_file" "ubuntu_image" {
  node_name    = "pve-01"
  datastore_id = "local"

  url          = "https://ftp.halifax.rwth-aachen.de/ubuntu-releases/24.04/ubuntu-24.04.3-live-server-amd64.iso"
  file_name    = "ubuntu-24.04.3-live-server-amd64.iso"
  content_type = "iso"

  overwrite = false
}

module "gitlab" {
  source = "./modules/virtual-machine"

  id   = 2001
  name = "gitlab"

  datastore = "data"
  node      = "pve-01"

  cores   = var.gitlab_cores
  memory  = var.gitlab_memory
  storage = var.gitlab_storage

  ipv4_address = var.gitlab_ipv4_address
  ipv4_gateway = var.network_gateway

  dns_servers = [var.network_dns_server]
  dns_domain  = var.network_dns_domain

  cdrom = proxmox_virtual_environment_download_file.ubuntu_image.id

  tags = ["ubuntu"]
}
