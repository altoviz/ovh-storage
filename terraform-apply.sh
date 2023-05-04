#!/bin/sh

echo Terraform apply

if [ -f ./credentials.sh ]; then
  . ./credentials.sh
fi

terraform -chdir=./setup apply "$@"
