# ovh-storage

OVHcloud Storage bootstrap

This bootstrap project allows you to copy your data to an OVH storage account as an easy and affordable backup solution from any cloud provider ☁️ like AWS, Azure, GCP, OVH or even from an on premise infrastructure 🏢.
It's also a very siple way to start your Terraform project for [OVHcloud](https://ovhcloud.com).

# Features

- Create your OVH infrastructure using [Terraform](https://terraform.io) including :

  - A Public Cloud Project
  - A user and password for your Public Cloud Project
  - An object storage for your data with different options depending on your needs
  - An object storage for the logs

- Supports

  - Storage location : Where your data will be located ?
  - Storage class : What kind of storage is appropriate ? Fast, standard, archive
  - Logging : Track every file operations
  - Versioning : Keep version of each file ?
  - Locks : Avoid any file modification
  - Retention : How long should keep files ?

- Copy your files to OVH using [Rclone](https://rclone.org) 🐏🐏
- Docker container support 📦
- Fully reusable ⚒️
- Super easy to run 😎

# Requirements

- [OVHcloud API credentials](https://help.ovhcloud.com/csm/en-api-getting-started-ovhcloud-api?id=kb_article_view&sysparm_article=KB0042777) to authenticate
- [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)
- [Docker](https://www.docker.com/) (Optional)

# Initial setup

1. Clone the repo using

   ```
   git clone https://github.com/altoviz/ovh-storage.git
   ```

2. Make script files executable

   ```
     cd ovh-storage
     chmod -R +x \*.sh
   ```

# Running the project

1. The credentials

   The first time you'll run any provided script, it will ensure that you have provided the OVHcloud credentials but you can start by running :

   ```
   ./credentials.sh
   ```

   If it does not exists, a credentials-private.sh file will be created containing something like :

   ```
    #!/bin/sh
    export OVH_APPLICATION_KEY_PRIVATE="<Your Application Private Key>"
    export OVH_APPLICATION_SECRET_PRIVATE="<Your Application Secret>"
    export OVH_CONSUMER_KEY_PRIVATE="<Your Consummer Key>"
    export OVH_REGION="<Your Deployment Region>"
    export OVH_ENDPOINT="<OVH endpoint>"
   ```

   You will have to replace the placeholders with the corresponding values. You can get the values using the following tutorial [Getting started with OVHcloud API](https://help.ovhcloud.com/csm/en-api-getting-started-ovhcloud-api?id=kb_article_view&sysparm_article=KB0042777). The important part is the ability to [create an API key](https://eu.api.ovh.com/createToken/).

2. The infrastructure

   To make things as simple as possible, we decide to use Terraform to setup the infrastructure. As every Terraform project, you will have to go through the init-plan-apply process. There's a script for each step so you don't even have to know Terraform.

   ```
    ./terraform-init.sh
    ./terraform-plan.sh
    ./terraform-apply.sh
   ```

   Now, you should have a running infrastructure in OVHcloud.

3. The data synchronization process

   You can use whatever AWS S3 compatible tool you want to interact with OVHcloud object storage as it supports the defacto standard.

   We use Rclone to sync our data, a [script file](process/usr_local_bin/syncdata.sh) to run it and a [Docker container](process/Dockerfile) to make it easy to run it everywhere.

   These are the 3 simple steps to run it. First, we build the docker container, then we run it and finaly, we display the output logs of the running container.

   ```
    ./docker-build.sh
    ./docker-run.sh
    ./docker-logs.sh
   ```

# OVHcloud

## Object Storage

Documentation about the 5 main features of the object storage

[Immutability](https://help.ovhcloud.com/csm/en-ie-public-cloud-storage-s3-managing-object-lock?id=kb_article_view&sysparm_article=KB0047398)

[Encryption](https://help.ovhcloud.com/csm/fr-public-cloud-storage-s3-encrypt-objects-sse-c?id=kb_article_view&sysparm_article=KB0047318)

[Users policies](https://help.ovhcloud.com/csm/en-ie-public-cloud-storage-s3-bucket-acl?id=kb_article_view&sysparm_article=KB0057090)

[Traceability](https://help.ovhcloud.com/csm/en-ie-public-cloud-storage-s3-server-access-logging?id=kb_article_view&sysparm_article=KB0056614)

Versioning (TBD)

# Rclone

Rclone a CLI tool of choice for very simple but effective copy and sync of files in cloud storage.

Follow this tutorial about [using Rclone with OVH](https://help.ovhcloud.com/csm/en-public-cloud-storage-s3-rclone?id=kb_article_view&sysparm_article=KB0047458)

# Docker

## How to use the provided image

The Docker file will use those environment variables to update the Rclone configuration.

- OVH_S3_ACCESS_KEY_ID
- OVH_S3_SECRET_ACCESS_KEY
- OVH_S3_REGION
- OVH_S3_BUCKET

Check the [script file](docker-run.sh) for a usage example.

## Things you could do to fit your needs

- Mount a Rclone config file
- Mount more than one data volume
- Add more variable to support another storage provider for a cloud to cloud approach

# License

This project is freely provided by [Altoviz](https://altoviz.com) as is. Use it at your own risk and benefit as long as you have fun doing it 😊.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
