output "domain_names" {
  value = [for d in libvirt_domain.vm_instance : d.name]
}

