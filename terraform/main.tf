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
      version = "3.30.0"
    }
  }
}

# local variables
locals {
  domain_private  = "iske.cloud"
  domain_public   = "pascaliske.dev"
  domain_github   = "pascaliske.github.io"
  public_ip_jakku = "89.58.45.252"
}
