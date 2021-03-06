
resource "proxmox_vm_qemu" "proxmox_master" {
  count             = local.instance_info.masters
  name              = "kube-master${local.start_num.master + count.index}"
  target_node       = "pve"
clone             = "ubuntu-2004-cloudinit-template"
os_type           = "cloud-init"
  cores             = local.cores.masters
  sockets           = "1"
  cpu               = "host"
  memory            = local.memory.masters
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"
disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "160G"
    format  = "raw"
    discard = "on"
}
disk {
    type    = "virtio"
    storage = "local-lvm"
    size    = "400G"
    format  = "raw"
    discard = "on"
}
network {
    model           = "virtio"
    bridge          = "vmbr0"
  }
lifecycle {
    ignore_changes  = [
      network,
    ]
  }
# Cloud Init Settings
  ipconfig0 = "ip=${local.proxaddr}${count.index}/24,gw=${var.gateway}"
}
