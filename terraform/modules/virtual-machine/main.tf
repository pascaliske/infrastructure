# --- providers
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.81.0"
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

  boot_order      = ["virtio0"]
  scsi_hardware   = "virtio-scsi-single"
  keyboard_layout = "de"

  startup {
    order    = var.order
    up_delay = 10
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

  disk {
    datastore_id = var.datastore
    interface    = "virtio0"
    file_format  = "raw"
    file_id      = var.image
    size         = 20
  }

  disk {
    datastore_id = var.datastore
    interface    = "virtio1"
    size         = var.storage
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
}
