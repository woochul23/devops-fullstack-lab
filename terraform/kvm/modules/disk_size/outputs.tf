output "size_in_bytes" {
    value       = var.size_in_gib * 1073741824
    description = "GiB 단위를 바이트로 환산한 값"
}