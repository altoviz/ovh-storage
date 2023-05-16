# Main bucket where our data copy will live
resource "aws_s3_bucket" "bucket" {
  bucket_prefix       = var.bucket_prefix
  object_lock_enabled = var.bucket_object_lock_enabled
}

resource "aws_s3_bucket_object_lock_configuration" "bucket_lock_conf" {
  count  = var.bucket_object_lock_enabled ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  rule {
    default_retention {
      mode = var.bucket_object_lock_retention_mode
      days = var.bucket_object_lock_retention_days
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.bucket_versioning
  }
}

resource "aws_s3_bucket_logging" "bucket_logging" {
  count         = var.bucket_log_enabled == true ? 1 : 0
  bucket        = aws_s3_bucket.bucket.id
  target_bucket = aws_s3_bucket.log_bucket[0].id
  target_prefix = "log/"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  //depends_on = [aws_s3_bucket_ownership_controls.bucket]
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
  # acl    = "public-read"
}

// TODO encryption
