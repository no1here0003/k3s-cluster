qm destroy 9000
qm create 9000 --name "ubuntu-2110-cloudinit-template" --memory 2048 --net0 virtio,bridge=vmbr0
qm importdisk 9000 ubuntu-21.10-server-cloudimg-amd64.qcow2 local-lvm
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-0
qm set 9000 --ide2 local-lvm:cloudinit
qm set 9000 --boot c --bootdisk scsi0
qm set 9000 --serial0 socket --vga serial0
qm template 9000
