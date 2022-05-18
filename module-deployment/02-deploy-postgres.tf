# SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
# SPDX-License-Identifier: GPL-3.0-or-later

# Deploy PostgreSQL for rollyourown projects
################################################

### Deploy postgres container
resource "lxd_container" "postgres" {

  remote     = var.host_id
  name       = "postgres"
  image      = join("-", [ local.module_id, "postgres", var.image_version ])
  profiles   = ["default"]
  
  config = { 
    "security.privileged": "false"
    "user.user-data" = file("cloud-init/cloud-init-postgres.yml")
  }
  
  ## Provide eth0 interface with static IP address
  device {
    name = "eth0"
    type = "nic"

    properties = {
      name           = "eth0"
      network        = var.host_id
      "ipv4.address" = join(".", [ local.lxd_host_network_part, local.postgres_ip_addr_host_part ])
      "ipv6.address" = join("", [ local.lxd_host_ipv6_prefix, "::", local.lxd_host_network_ipv6_subnet, ":", local.postgres_ip_addr_host_part ])
    }
  }
  
  ## Mount container directory for postgres data
  device {
    name = "postgres-data"
    type = "disk"
    
    properties = {
      source   = join("", ["/var/containers/", local.module_id, "/postgres/data"])
      path     = "/var/pgdata"
      readonly = "false"
      shift    = "true"
    }
  }

  ## Mount container directory for postgres backups
  device {
    name = "postgres-backups"
    type = "disk"
    
    properties = {
      source   = join("", ["/var/containers/", local.module_id, "/postgres/backup"])
      path     = "/var/pgbackup"
      readonly = "false"
      shift    = "true"
    }
  }
}
