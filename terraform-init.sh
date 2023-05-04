#!/bin/sh

echo Terraform init

if [ -f ./credentials.sh ]; then
  . ./credentials.sh
fi

terraform -chdir=./setup init