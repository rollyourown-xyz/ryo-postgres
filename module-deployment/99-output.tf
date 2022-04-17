# SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
# SPDX-License-Identifier: GPL-3.0-or-later

# Output variable definitions

output "postgres_ipv4_address" {
    value       = lxd_container.postgres.ipv4_address
    description = "IPv4 Address of the postgres container"
}

output "postgres_ipv6_address" {
    value       = lxd_container.postgres.ipv6_address
    description = "IPv6 Address of the postgres container"
}
