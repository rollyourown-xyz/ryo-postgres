terraform {
  required_version = ">= 0.15"
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = ">= 1.14.0"
    }
  }
}

###
# Provision postgresql database with user
###

# Create postgresql database role name to own the database
#
resource "postgresql_role" "role" {
  name             = var.postgres_db_owner
  login            = true
  password         = var.postgres_db_owner_password
}

# Create database
#
resource "postgresql_database" "db" {

  depends_on = [ postgresql_role.role ]

  name              = var.postgres_db_name
  owner             = var.postgres_db_owner
  template          = var.postgres_db_template
  encoding          = var.postgres_db_encoding
  lc_collate        = var.postgres_db_lc_collate
  lc_ctype          = var.postgres_db_lc_type
  allow_connections = true
}
