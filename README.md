# ovh-storage

OVH Storage bootstrap

**_ THIS IS A WORK IN PROGRESS PROJECT _**

This bootstrap project allows you to copy your data to an OVH storage account as an easy and affordable backup solution from any cloud provider ☁️ like AWS, Azure, GCP, OVH or even from an on premise infrastructure 🏢.

# Features

- Create your OVH infrastructure using [Terraform](https://terraform.io) including :

  - A cloud project
  - A user and password for your cloud project
  - An object storage for your data
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

   You will have to replace the placeholders with the corresponding values. You can get the values using the following tutorial [Getting started with OVHcloud API](https://help.ovhcloud.com/csm/en-api-getting-started-ovhcloud-api?id=kb_article_view&sysparm_article=KB0042777)

2. The infrastructure

   To make things as simple as possible, we decide to use Terraform to setup the infrastructure. As every Terraform project, you will have to go through the init-plan-apply process. There's a script for each step so you don't even have to know Terraform.

   ```
    ./terraform-init.sh
    ./terraform-plan.sh
    ./terraform-apply.sh
   ```

   Now, you should have running infrastructure in OVHcloud.

3. The data synchronization process

   ```
    ./docker-build.sh
    ./docker-run.sh
    ./docker-logs.sh
   ```

# Rclone

[Using Rclone with OVH](https://help.ovhcloud.com/csm/en-public-cloud-storage-s3-rclone?id=kb_article_view&sysparm_article=KB0047458)

# Docker

Mount a Rclone config file
Mount one or more data volumes

# License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
