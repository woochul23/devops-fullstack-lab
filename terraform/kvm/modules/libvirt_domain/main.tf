terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}

resource "libvirt_domain" "vm_instance" {
  for_each = var.vm_definitions
  name = each.key
  memory = var.memory_in_mib[each.key]
  vcpu = each.value.cpu
  disk {
    volume_id = var.volume_ids[each.key] 
  }
  cloudinit = var.cloudinit_ids[each.key]

  network_interface {
    bridge = var.bridge_name
  }
  cpu {
    mode = "host-passthrough"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }

}

