

resource "proxmox_virtual_environment_vm" "k8s_master" {
  name        = "k8s-master"
  node_name   = "pve"
  description = "K8s Master Node"
  agent {
    enabled = true
  }
  clone {
    vm_id = 5000
  }
  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}

resource "proxmox_virtual_environment_vm" "k8s_1" {
  name        = "k8s-1"
  node_name   = "pve"
  description = "K8s Slave Node 1"
  agent {
    enabled = true
  }
  clone {
    vm_id = 5000
  }
  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"

      }
    }
  }
}


resource "proxmox_virtual_environment_vm" "k8s_2" {
  name        = "k8s-2"
  node_name   = "pve"
  description = "K8s Slave Node 2"
  agent {
    enabled = true
  }
  clone {
    vm_id = 5000
  }
  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"

      }
    }
  }
}
