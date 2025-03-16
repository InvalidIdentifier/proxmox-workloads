provider "proxmox" {
  pm_api_url= "https://${var.proxmox_host}:8006/api2/json"
  pm_tls_insecure = true
}

variable "target_node_241" {
  default = "node241"
}

variable "target_node_242" {
  default = "node242"
}

variable deb12_template_241 {
  default = "debtemplate241"
}

variable deb12_template_242 {
  default = "debtemplate242"
}

variable "proxmox_host" {}

variable "ssh_server_pub_key" {}

variable "ssh_laptop_pub_key" {}

variable "user_username" {}

variable "user_password" {}

variable "vlan_infra" {}

variable "vlan_dmz" {}

variable "vlan_base" {}
