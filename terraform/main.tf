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
      version = "3.1.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.26.0"
    }
  }
}

data "sops_file" "secrets" {
  source_file = "secrets.sops.yaml"
}
