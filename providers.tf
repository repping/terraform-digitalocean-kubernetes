terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.26.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.3.0"
    }
  }
}

provider "digitalocean" {
  token = var.do-token
}

provider "local" {}