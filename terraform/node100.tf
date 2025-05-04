resource "proxmox_vm_qemu" "vmQemuNode100" {
    target_node = var.target_node_242
    name        = "node100"
    clone       = var.deb12_template_242
    vmid        = "100"

    cores       = 4
    sockets     = 1
    cpu         = "host"
    memory      = 1024
    boot        = "order=scsi0"
    hastate     = "started"
    hagroup     = "HA"
    tags        = "docker,dmz"
    scsihw      = "virtio-scsi-pci"

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
        tag    = 254
    }

    os_type         = "cloud-init"
    ipconfig0       = "ip=${var.vlan_dmz}.100/24,gw=${var.vlan_dmz}.1"
    nameserver      = "${var.vlan_base}.1"
    ciuser          = var.user_username
    cipassword      = var.user_password
    agent           = 1
    sshkeys = <<EOF
    ${var.ssh_server_pub_key}
    ${var.ssh_laptop_pub_key}
EOF
}
