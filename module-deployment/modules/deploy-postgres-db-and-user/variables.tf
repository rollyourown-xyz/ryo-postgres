# SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
# SPDX-License-Identifier: GPL-3.0-or-later

# Input variable definitions

variable "postgres_db_name" {
  description = "The name of the postgresql database to deploy."
  type        = string
}

variable "postgres_db_owner" {
  description = "The postgresql role name of the user who will own the database."
  type        = string
}

variable "postgres_db_owner_password" {
  description = "The password for the postgresql role."
  type        = string
  sensitive   = true
}

variable "postgres_db_template" {
  description = "The name of the template database from which to create the database."
  type        = string
  default     = "template0"
}

variable "postgres_db_encoding" {
  description = "Default character set encoding to use in the database."
  type        = string
  default     = "UTF8"
}

variable "postgres_db_lc_collate" {
  description = "Collation order to use in the database."
  type        = string
  default     = "C"
}

variable "postgres_db_lc_type" {
  description = "Character classification to use in the database."
  type        = string
  default     = "C"
}
