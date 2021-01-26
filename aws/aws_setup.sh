#!/bin/bash
### AWS
vault secrets enable aws
vault write aws/config/root access_key=$AWS_ACCESS_KEY_ID secret_key=$AWS_SECRET_ACCESS_KEY region=us-east-1

vault write aws/roles/my-role \
credential_type=iam_user \
default_ttl=1h \
max_ttl=2h \
policy_document=-<<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": "ec2:*",
          "Resource": "*"
        }
      ]
    }
EOF

vault read aws/creds/my-role
