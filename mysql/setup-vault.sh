#!/bin/bash
set -e

## Setup Vault
vault secrets enable database

vault write database/config/my-mysql-database \
  plugin_name=mysql-database-plugin \
  connection_url="{{username}}:{{password}}@tcp(localhost:3306)/" \
  allowed_roles="my-role" username="vaultadmin" password="vaultpw"

vault write database/roles/my-role \
  db_name=my-mysql-database \
  creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%';" default_ttl="1h" max_ttl="24h"
