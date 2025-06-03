terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}

provider "libvirt" {
  uri = var.qemu_url
}

module "kvm_vm" {
  providers = {
    libvirt = libvirt
  }

  source = "./modules/libvirt_domain"

  vm_definitions  = var.vm_definitions
  volume_ids      = { for k, v in libvirt_volume.os_vol : k => v.id }
  cloudinit_ids   = { for k, v in libvirt_cloudinit_disk.cloudinit_disk : k => v.id }

  memory_in_mib   = {
    for k in keys(var.vm_definitions) :
    k => module.memory_size[k].size_in_mib
  }

  bridge_name     = var.bridge_name
  network         = var.network
}

module "memory_size" {
  for_each = var.vm_definitions
  source   = "./modules/memory_size"

  size_of_memory = each.value.memory
}

module "os_disk" {
  for_each = var.vm_definitions
  source   = "./modules/disk_size"

  size_in_gib = each.value.disk_size
}

