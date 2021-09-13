# Deploy a postgres database and user

This module provisions a PostgreSQL database and user. Various properties of the database and user are specified by input variables:

* postgres_db_name (string): The name of the postgresql database to deploy.

* postgres_db_owner (string): The postgresql role name of the user who will own the database.

* postgres_db_owner_password (string): The password for the postgresql role.

* postgres_db_template (string): The name of the template database from which to create the database. Default value is "template0".

* postgres_db_encoding (string): The default character set encoding to use in the database. Default value is "UTF8".

* postgres_db_lc_collate (string): The collation order to use in the database. Default value is "C".

* postgres_db_lc_type (string): The character classification to use in the database. Default value is "C".
