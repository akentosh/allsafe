#!/bin/bash
set -e
## Vault demo for Allsafe
### Static Secrets
    vault secrets list -detailed
    vault secrets enable -path allsafe kv-v2
    vault kv put allsafe/demo/creds username="sysdba" password="staticpassword"
    vault kv get allsafe/demo/creds
    vault kv put -output-curl-string allsafe/demo/app-creds username="app1" password="12345678"
    vault kv get -field=username allsafe/demo/creds
    vault kv put allsafe/demo/creds password="another-static-password"
    vault kv get allsafe/demo/creds

### Transit
Switch to UI
