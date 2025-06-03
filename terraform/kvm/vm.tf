resource "libvirt_cloudinit_disk" "cloudinit_disk" {
	for_each = var.vm_definitions
	name = "${each.key}-cloudinit.iso"
	user_data = data.template_file.user_data[each.key].rendered	
	network_config = data.template_file.network_config[each.key].rendered
}

data "template_file" "user_data" {
	for_each = var.vm_definitions
	template = file("${path.module}/cloud_init.cfg")
	vars = {
		ssh_key = var.ssh_key
		hostname = each.value.hostname
		}
}

data "template_file" "network_config" {
	for_each = var.vm_definitions
	template = file("${path.module}/network_config.cfg")
	vars = {
		ip 			= "${var.network}.${each.value.ip_suffix}"
		network = var.network
		prefix = var.prefix
		gateway = var.gateway
		}
	}

resource "libvirt_volume" "os_vol" {
	for_each = var.vm_definitions
	name = "${each.key}.disk.qcow2"
	size = module.os_disk[each.key].size_in_bytes
	format = "qcow2"	
	base_volume_name = var.base_volume
	base_volume_pool = var.base_pool
	pool = var.pool
}
