terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.1"
    }
  }
}

provider "proxmox" {
  endpoint  = var.api_url
  api_token = "${var.api_token_id}=${var.api_token_secret}"
}
