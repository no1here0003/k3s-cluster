
resource "proxmox_vm_qemu" "proxmox_worker" {
  count             = local.instance_info.workers
  name              = "kube-worker${local.start_num.worker + count.index}"
  target_node       = "pve"
clone             = "ubuntu-2004-cloudinit-template"
os_type           = "cloud-init"
  cores             = local.cores.workers
  sockets           = "1"
  cpu               = "host"
  memory            = local.memory.workers
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"
disk {
    size            = "400G"
    type            = "scsi"
    storage         = "local-lvm"
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
  ipconfig0 = "ip=${local.proxaddr}${count.index + local.instance_info.masters}/24,gw=${var.gateway}"
}