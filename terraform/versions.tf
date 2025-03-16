terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }

  backend "local" {
    path = "/tmp/state/pve_guest_state.tfstate"
  }
  required_version = ">= 0.13"
}
