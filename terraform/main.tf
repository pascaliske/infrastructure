terraform {
  backend "remote" {
    organization = "pascaliske"

    workspaces {
      name = "infrastructure"
    }
  }

  required_version = ">= 1.3.3"

  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }

    proxmox = {
      source  = "bpg/proxmox"
      version = "0.93.0"
    }

    talos = {
      source  = "siderolabs/talos"
      version = "0.10.1"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.16.0"
    }
  }
}

# local variables
locals {
  domain_internal = "iske.cloud"
  domain_external = "pascaliske.dev"
  domain_github   = "pascaliske.github.io"
  public_ip_jakku = "89.58.45.252"
}
