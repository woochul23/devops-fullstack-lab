output "size_in_mib" {
    value       = var.size_of_memory * 1024
    description = "giB 단위를 MB로 환산한 값"
}
