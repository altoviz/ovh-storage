data "ovh_order_cart" "order_cart" {
  ovh_subsidiary = "fr"
  description    = "Order cart"
}

data "ovh_order_cart_product_plan" "product_plan" {
  cart_id        = data.ovh_order_cart.order_cart.id
  price_capacity = "renew"
  product        = "cloud"
  plan_code      = "project.2018"
}

resource "ovh_cloud_project" "cloud_project" {
  ovh_subsidiary = data.ovh_order_cart.order_cart.ovh_subsidiary
  description    = var.project_description
  //payment_mean   = "fidelity"
  plan {
    duration     = data.ovh_order_cart_product_plan.product_plan.selected_price.0.duration
    plan_code    = data.ovh_order_cart_product_plan.product_plan.plan_code
    pricing_mode = data.ovh_order_cart_product_plan.product_plan.selected_price.0.pricing_mode
  }
}

resource "ovh_cloud_project_user" "admin" {
  service_name = ovh_cloud_project.cloud_project.project_id
  role_name    = "administrator"
}

# Getting AWS S3 compatible credentials from the OVH Cloud Project user so we can use aws_s3_* objects
resource "ovh_cloud_project_user_s3_credential" "admin_s3_cred" {
  service_name = ovh_cloud_project.cloud_project.project_id
  user_id      = ovh_cloud_project_user.admin.id
}

# resource "openstack_objectstorage_container_v1" "nextcloud_container" {
#   provider     = openstack.ovh
#   region       = var.region
#   name         = "backup"
#   content_type = "application/json"
# }

