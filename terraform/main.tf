terraform {
  backend "remote" {
    organization = "pascaliske"

    workspaces {
      name = "infrastructure"
    }
  }

  required_version = ">= 1.3.3"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.10.0"
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
