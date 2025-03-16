resource "proxmox_vm_qemu" "vmQemuNode121" {
    target_node = var.target_node_242
    name        = "node121"
    clone       = var.deb12_template_242
    vmid        = "121"

    cores       = 4
    sockets     = 1
    cpu         = "host"
    memory      = 8000
    boot        = "order=scsi0"
    hastate     = "started"
    hagroup     = "HA"
    tags        = "infra"

    disks {
        scsi {
            scsi0 {
                disk {
                    cache      = "none"
                    discard    = true
                    emulatessd = true
                    size       = 50
                    storage    = "fast_data"
                    replicate  = true
                }
            }
            scsi1 {
                disk {
                    cache      = "none"
                    discard    = true
                    emulatessd = true
                    size       = 200
                    storage    = "slow_data"
                    replicate  = true
                }
            }
        }
        ide {
            ide3 {
                cloudinit {
                  storage = "fast_data"
                }
            }
        }
    }

    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    os_type         = "cloud-init"
    ipconfig0       = "ip=${var.vlan_infra}.121/24,gw=${var.vlan_infra}.1"
    nameserver      = "${var.vlan_base}.1"
    ciuser          = var.user_username
    cipassword      = var.user_password
    agent           = 1
    sshkeys = <<EOF
    ${var.ssh_server_pub_key}
    ${var.ssh_laptop_pub_key}
EOF
}
