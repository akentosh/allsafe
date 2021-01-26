#!/bin/bash
set -e

## Demo
### Show users
sudo mysql -uroot -psupersecret -e 'select user,password from mysql.user;'

### Generate creds
vault read database/creds/my-role

### Show users
sudo mysql -uroot -psupersecret -e 'select user,password from mysql.user;'

### Revoke the lease
vault lease revoke database/creds/my-role/somevalue...

### Remove the dynamic creds
sudo mysql -uroot -psupersecret -e 'select user,password from mysql.user;'
