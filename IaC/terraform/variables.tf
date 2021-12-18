variable "pm_api_url" {
  default = {
    vms1 = "https://192.168.2.10:8006/api2/json"
    vms2 = "https://192.168.2.15:8006/api2/json"
    vms3 = "https://192.168.2.20:8006/api2/json"
    vms4 = "https://192.168.2.11:8006/api2/json"
    vms5 = "https://192.168.2.12:8006/api2/json"
    vms6 = "https://192.168.2.13:8006/api2/json"
  }
}

# Variable below is the one used to switch Proxmox servers
variable "env" {
  default = "vms1"
}

variable "consul_address" {
  type = string
  description = "Address of consul server"
  default = "192.168.1.25"
}

variable "consul_port" {
  type = number
  description = "Port consul is listening on"
  default = 8500
}

variable "consul_datacenter" {
  type = string
  description = "name of consul datacenter"
  default = "dc1"
}

variable "pm_user" {
  default = "root@pam"
}


variable "proxmox_env" {
  type = list
  default = [
    "vms1",
    "vms2",
    "vms3",
    "vms4",
    "vms5",
    "vms6"
  ]
}

variable "proxaddr" {
  default = {
    vms1 = "192.168.2.10"
    vms2 = "192.168.2.15"
    vms3 = "192.168.2.20"
    vms4 = "192.168.2.11"
    vms5 = "192.168.2.12"
    vms6 = "192.168.2.13"
  }
}

variable "gateway" {
  default = "192.168.2.1"
}

variable "cores" {
  default = {
    vms1 = {
      masters = 2
      workers = 3
    }
    vms2 = {
      masters = 2
      workers = 3
    }
    vms3 = {
      masters = 2
      workers = 3
    }
    vms4 = {
      masters = 4
      workers = 8
    }
    vms5 = {
      masters = 6
      workers = 12
    }
    vms6 = {
      masters = 6
      workers = 12
    }
  } 
}


# Added master_start and worker_start to keep network collisions down
variable "num_instances" {
  default = {
    vms1 = {
      masters = 1
      workers = 2
    }
    vms2 = {
      masters = 1
      workers = 2
    }
    vms3 = {
      masters = 1
      workers = 2
    }
    vms4 = {
      masters = 1
      workers = 2
    }
    vms5 = {
      masters = 1
      workers = 3
    }
    vms6 = {
      masters = 1
      workers = 3
    }
  }
}

variable "instance_start" {
  default = {
    vms1 = {
      master = 1
      worker = 1
    }
    vms2 = {
      master = 2
      worker = 3
    }
    vms4 = {
      master = 3
      worker = 5
    }
    vms5 = {
      master = 4
      worker = 7
    }
    vms6 = {
      master = 5
      worker = 10
    }
  }
}


variable "memory" {
  default = {
    vms1 = {
      masters = 16384
      workers = 16384
    }
    vms2 = {
      masters = 16384
      workers = 16384
    }
    vms3 = {
      masters = 16384
      workers = 16384
    }
    vms4 = {
      masters = 16384
      workers = 16384
    }
    vms5 = {
      masters = 16384
      workers = 32768
    }
    vms6 = {
      masters = 16384
      workers = 32768
    }
  }
}



locals {
  env = lower(terraform.workspace)
  start_num = lookup(var.instance_start, lower(terraform.workspace))
  instance_info = lookup(var.num_instances, lower(terraform.workspace))
  proxaddr = lookup(var.proxaddr, lower(terraform.workspace))
  memory = lookup(var.memory, lower(terraform.workspace))
  cores = lookup(var.cores, lower(terraform.workspace))
  local_cmd = "../shell/master.sh" 
  local_cmd2 = "../shell/other_masters.sh" 
  local_cmd3 = "../shell/workers.sh" 
  local_cmd4 = "../shell/post_install.sh && kubectl create ns vpn"
  helm_run = (lower(terraform.workspace)) == "software" ? 1 : 0
  cmd_count = ( lower(terraform.workspace) == "vms1" ? 1 : 0)
  consul_port = 8500
  consul_address = "192.168.1.25"
  create_duration = (lower(terraform.workspace) == "vms1" ? 180 : 1)
}
