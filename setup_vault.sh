#!/bin/bash
set -e

## Vault Config
nohup vault server -dev -dev-root-token-id=root &>/tmp/vault.log &&
wait 10 &&
vault write sys/license $(cat ~/.ssh/vault.hclic)
