variable "worker_count" {
  description = "Number of Kubernetes worker nodes"
  type        = number
  default     = 2
}

resource "proxmox_virtual_environment_vm" "k8s_master" {
  name        = "k8s-master"
  node_name   = "pve"
  description = "K8s Master Node"
  
  agent {
    enabled = true
  }

  clone {
    vm_id = 5000  # Ensure this is a Cloud-Init template
  }

  cpu {
    type    = "host"
    cores   = 4
    sockets = 1
  }

  memory {
    dedicated = 8192  # 8GB RAM
  }

  initialization {
    datastore_id = "local-lvm"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

# ========================== WORKER NODES ==========================
resource "proxmox_virtual_environment_vm" "k8s_worker" {
  count       = var.worker_count
  name        = "k8s-worker-${count.index + 1}"
  node_name   = "pve"
  description = "K8s Worker Node ${count.index + 1}"
  
  agent {
    enabled = true
  }

  clone {
    vm_id = 5000  # Ensure this is a Cloud-Init template
  }

  cpu {
    type    = "host"
    cores   = 2
    sockets = 1
  }

  memory {
    dedicated = 4096  # 4GB RAM
  }

  initialization {
    datastore_id = "local-lvm"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}