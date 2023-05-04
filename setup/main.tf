provider "ovh" {
  # endpoint           = "ovh-eu"
  # application_key    = ""
  # application_secret = ""
  # consumer_key       = ""
}
provider "openstack" {
  auth_url         = ovh_cloud_project_user.admin.openstack_rc["OS_AUTH_URL"]
  domain_name      = "Default"
  user_domain_name = "Default"
  alias            = "ovh"
  user_name        = ovh_cloud_project_user.admin.username
  tenant_id        = ovh_cloud_project.cloud_project.project_id
  tenant_name      = ovh_cloud_project.cloud_project.project_name
  password         = ovh_cloud_project_user.admin.password
}

provider "aws" {
  region     = var.region
  access_key = ovh_cloud_project_user_s3_credential.admin_s3_cred.access_key_id
  secret_key = ovh_cloud_project_user_s3_credential.admin_s3_cred.secret_access_key
  #OVH implementation has no STS service
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  # the gra region is unknown to AWS hence skipping is needed.
  skip_region_validation = true
  endpoints {
    s3 = format("https://s3.%s.%s.cloud.ovh.net", var.region, var.bucket_class)
  }
}

provider "aws" {
  alias      = "aws_log"
  region     = var.region
  access_key = ovh_cloud_project_user_s3_credential.admin_s3_cred.access_key_id
  secret_key = ovh_cloud_project_user_s3_credential.admin_s3_cred.secret_access_key
  #OVH implementation has no STS service
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  # the gra region is unknown to AWS hence skipping is needed.
  skip_region_validation = true
  endpoints {
    s3 = format("https://s3.%s.io.cloud.ovh.net", var.region)
  }
}

provider "random" {
}

terraform {
  required_version = ">= 1.0"
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "=0.30.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "=1.51.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "=4.65.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.4.3"
    }
  }
}
