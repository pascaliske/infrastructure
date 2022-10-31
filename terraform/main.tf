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
      version = "3.2.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.26.0"
    }
  }
}
