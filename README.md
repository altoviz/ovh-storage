# ovh-storage

OVH Storage bootstrap

**_ THIS IS A WORK IN PROGRESS PROJECT _**

This bootstrap project allows you to copy your data to an OVH storage account as an easy and affordable backup solution from any cloud provider like AWS, Azure, GCP, OVH or even from an on premise infrastructure.

# Features

- Create your OVH infrastructure using [Terraform](https://terraform.io)

  - Cloud project
  - Object storage

- Supports

  - Storage location : Where your data will be located ?
  - Storage class : What kind of storage is appropriate ? Fast, standard, archive
  - Logging : Track every file operations
  - Versioning : Keep version of each file ?
  - Locks : Avoid any file modification
  - Retention : How long should keep files ?

- Copy your files to OVH using [Rclone](https://rclone.org)
- Docker container support
- Fully reusable

## Requirements

You will need to get [OVHcloud API credentials](https://help.ovhcloud.com/csm/en-api-getting-started-ovhcloud-api?id=kb_article_view&sysparm_article=KB0042777).

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

# Rclone

[Using Rclone with OVH](https://help.ovhcloud.com/csm/en-public-cloud-storage-s3-rclone?id=kb_article_view&sysparm_article=KB0047458)

# Docker

Mount a Rclone config file
Mount one or more data volumes

# License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
