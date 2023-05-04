output "admin_username" {
  value = ovh_cloud_project_user.admin.username
}

output "admin_password" {
  value     = ovh_cloud_project_user.admin.password
  sensitive = true
}

output "s3_access_key_id" {
  value = ovh_cloud_project_user_s3_credential.admin_s3_cred.access_key_id
}

output "s3_secret_access_key" {
  value     = ovh_cloud_project_user_s3_credential.admin_s3_cred.secret_access_key
  sensitive = true
}

output "s3_bucket" {
  value = aws_s3_bucket.bucket.bucket
}

output "s3_region" {
  value = var.region
}

# output "admin_openstack_auth_url" {
#   value = ovh_cloud_project_user.admin.openstack_rc["OS_AUTH_URL"]
# }
# output "admin_openstack_tenant_id" {
#   value = ovh_cloud_project_user.admin.openstack_rc["OS_TENANT_ID"]
# }
# output "admin_openstack_tenant_name" {
#   value = ovh_cloud_project_user.admin.openstack_rc["OS_TENANT_NAME"]
# }
# output "admin_openstack_username" {
#   value = ovh_cloud_project_user.admin.openstack_rc["OS_USERNAME"]
# }
