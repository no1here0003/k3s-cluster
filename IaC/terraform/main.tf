terraform {
  required_version = ">= 0.15"
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

terraform {
  backend "consul" {
    address = "192.168.1.25:8500"
    scheme = "http"
    path = "k3s/state"
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


provider "consul" {
  address = "${var.consul_address}:${var.consul_port}"
  datacenter = var.consul_datacenter
}


data "consul_keys" "pm_password" {
  key {
    name = "pm_password"
    path = "k3s/config/terraform"
  }
}


data "consul_keys" "kubepass" {
  key {
    name = "kubepass"
    path = "k3s/config/terraform"
  }
}

data "consul_keys" "vault_token" {
  key {
    name = "token"
    path = "k3s/config/terraform"
  }
}

provider "proxmox" {
    pm_api_url = lookup(var.pm_api_url, local.env)
    pm_user = var.pm_user
    pm_password = jsondecode(data.consul_keys.pm_password.var.pm_password)["pm_password"]
}

