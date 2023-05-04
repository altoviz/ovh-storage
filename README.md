# ovh-storage

OVH Storage bootstrap

**_ THIS IS A WORK IN PROGRESS PROJECT _**

This bootstrap project allows you to copy your data to an OVH storage account as an easy and affordable backup solution from any cloud provider like AWS, Azure, GCP, OVH or even from an on premise infrastructure.

# Initial setup

1. Clone the repo using

   ```
   git clone https://github.com/altoviz/ovh-storage.git
   ```

2. Make script files executable

   ```
     chmod -R +x \*.sh
   ```

3. Create a file called "credentials-private.sh" next to "credentials.sh with the following and replace the placeholders

   ```
   #!/bin/sh
   export OVH_APPLICATION_KEY_PRIVATE=<Your Application Private Key>
   export OVH_APPLICATION_SECRET_PRIVATE=<Your Application Secret>
   export OVH_CONSUMER_KEY_PRIVATE=<Your Consummer Key>
   ```

# Features

- Create your OVH infrastructure using [Terraform](https://terraform.io)
- Supports

  - Storage location
  - Storage class
  - Logging
  - Versioning
  - Locks
  - Retention

- Copy your files to OVH using [Rclone](https://rclone.org)
- Docker container support

## Requirements

You will need to get [OVHcloud API credentials](https://help.ovhcloud.com/csm/en-api-getting-started-ovhcloud-api?id=kb_article_view&sysparm_article=KB0042777).

# Rclone

Using Rclone with OVH https://rclone.org/swift/

# Docker

Mount a Rclone config file
Mount one or more data volumes

# License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
