#!/bin/bash

set -e

cd /tmp

echo "Installing MySQL..."
sudo apt-get update -y
sudo apt-get install -y mariadb-server
echo "\n[mysqld]\nbind-address=0.0.0.0\nskip-name-resolve=1" | sudo tee -a /etc/mysql/my.cnf

# Start MySQL and set password
sudo systemctl start mysql
sudo mysqladmin -uroot password 'supersecure'

# Create Vault user
sudo mysql -u root -p'supersecure' << EOF
GRANT ALL PRIVILEGES ON *.* TO 'vaultadmin'@'%' IDENTIFIED BY 'vaultpw' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
