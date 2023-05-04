#!/bin/sh

echo Terraform plan

if [ -f ./credentials.sh ]; then
  . ./credentials.sh
fi

terraform -chdir=./setup plan $@