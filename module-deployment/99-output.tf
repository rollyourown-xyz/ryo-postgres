# Output variable definitions

output "postgres_ip_address" {
    value       = lxd_container.postgres.ip_address
    description = "IP Address of the postgres container"
}
