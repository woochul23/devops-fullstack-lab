variable "vm_definitions" {
  type = map(object({
    hostname   = string
    memory     = number
    cpu        = number
    disk_size  = number
    ip_suffix  = number
  }))
}

variable "volume_ids" {
  type = map(string)
}

variable "cloudinit_ids" {
  type = map(string)
}

variable "memory_in_mib" {
  type = map(number)
}

variable "bridge_name" {
  type = string
}

variable "network" {
  type = string
}

