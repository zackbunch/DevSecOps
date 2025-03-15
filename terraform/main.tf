

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name        = "k8s-master"
  node_name   = "pve"
  description = "K8s Master Node"
  started     = true
  agent {
    enabled = true
  }
  clone {
    vm_id = 5000
  }
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.100/24"
        gateway = "192.168.0.1"
      }
    }
  }





}
