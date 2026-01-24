# --- providers
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.93.0"
    }
  }
}

# --- create virtual machine
resource "proxmox_virtual_environment_vm" "this" {
  node_name = var.node
  vm_id     = var.id

  name        = var.name
  description = "Managed by Terraform"
  tags        = concat(["terraform"], var.tags)

  boot_order      = ["${var.storage_bus}0"]
  scsi_hardware   = "virtio-scsi-single"
  keyboard_layout = "de"

  started = var.started

  dynamic "startup" {
    for_each = var.order >= 0 ? [0] : []

    content {
      order    = var.order
      up_delay = 10
    }
  }

  agent {
    enabled = true
  }

  operating_system {
    type = "l26"
  }

  cpu {
    cores = var.cores
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = var.memory
  }

  network_device {
    bridge   = "vmbr0"
    firewall = true
  }

  # use bootable image as first disk if image is supplied
  dynamic "disk" {
    for_each = var.image != null ? [0] : []

    content {
      datastore_id = var.datastore
      interface    = "${var.storage_bus}0"
      file_format  = "raw"
      file_id      = var.image
      size         = 80
    }
  }

  # use boot disk as first disk if image is not supplied
  dynamic "disk" {
    for_each = var.image == null ? [0] : []

    content {
      datastore_id = var.datastore
      interface    = "${var.storage_bus}0"
      size         = 20
    }
  }

  dynamic "disk" {
    for_each = var.storage > 0 ? [0] : []

    content {
      datastore_id = var.datastore
      interface    = "${var.storage_bus}1"
      size         = var.storage
    }
  }

  dynamic "cdrom" {
    for_each = var.cdrom != null ? [0] : []

    content {
      file_id   = var.cdrom
      interface = "ide0"
    }
  }

  initialization {
    datastore_id = var.datastore
    interface    = "ide2"

    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }

    dns {
      servers = var.dns_servers
      domain  = var.dns_domain
    }
  }

  # ignore if cdrom is removed manually
  lifecycle {
    ignore_changes = [cdrom]
  }
}
