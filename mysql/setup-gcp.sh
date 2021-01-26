#!/bin/bash
set -e

## Setup
echo "Creating instance"
gcloud compute instances create mysqlvaultdemo \
  --zone us-east4-c \
  --image-family=ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud &&

echo "Waiting for the instance to be ready"
sleep 60 &&

echo "Adding files to the instance"
gcloud compute scp --zone us-east4-c \
  scripts/install_mysql_ubuntu.sh \
  mysqlvaultdemo:~/ &&

gcloud compute scp --zone us-east4-c \
  scripts/demo.sh \
  mysqlvaultdemo:~/

## SSH
#gcloud compute ssh --zone us-east4-c mysqlvaultdemo -- -L 3306:localhost:3306

## Run on instance
#./install_mysql_ubuntu.sh

### Cleanup
#gcloud compute instances delete mysqlvaultdemo
