variable "vm_definitions" {
  type = map(object({
    hostname  = string
    memory    = number
    cpu       = number
    disk_size = number
    ip_suffix = number
  }))
}

# 공통 변수들
variable "bridge_name" { type = string }
variable "network"     { type = string }
variable "pool"        { type = string }
variable "base_pool"   { type = string }
variable "base_volume" { type = string }
variable "qemu_url"    { type = string }
variable "ssh_key" {
  type = string
  description = "SSH 공개 키"
}

variable "prefix" {
  type = string
  description = "서브넷 prefix 예: 16"
}

variable "gateway" {
  type = string
  description = "게이트웨이 IP 예: 10.12.0.1"
}
