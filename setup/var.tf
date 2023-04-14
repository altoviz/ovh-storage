# dev(elopment) | sta(ging) | pro(duction)
variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment TLA"
}
variable "region" {
  type        = string
  default     = "gra"
  description = "Deployment location"
}
variable "project_description" {
  type        = string
  default     = "ovh-storage"
  description = "Cloud Project name"
}
variable "bucket_prefix" {
  type        = string
  default     = "backup-"
  description = "Storage bucket prefix"
}
variable "bucket_log_enabled" {
  type        = bool
  default     = "true"
  description = "Enable logging stored in another bucket"
}
variable "bucket_log_retention_days" {
  type        = number
  default     = 90
  description = "Log retention in days"
}
variable "bucket_object_lock_enabled" {
  type        = bool
  default     = "false"
  description = ""
}
variable "bucket_object_lock_retention_mode" {
  type = string
  # COMPLIANCE, GOVERNANCE
  default     = "COMPLIANCE"
  description = "Retention mode"
}
variable "bucket_object_lock_retention_days" {
  type        = number
  default     = 365
  description = "Retention days"
}
variable "bucket_versioning" {
  type = string
  # Enabled, Suspended, or Disabled
  default     = "Disabled"
  description = "Versioning"
}
