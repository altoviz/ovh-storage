# Bucket dedicated to logs
resource "aws_s3_bucket" "log_bucket" {
  provider = aws.aws_log
  count    = var.bucket_log_enabled ? 1 : 0
  bucket   = "${aws_s3_bucket.bucket.bucket}-log"
}

resource "aws_s3_bucket_lifecycle_configuration" "log_bucket_lifecycle_conf" {
  provider = aws.aws_log
  count    = var.bucket_log_enabled ? 1 : 0
  bucket   = aws_s3_bucket.log_bucket[0].id
  rule {
    id = "rule-1"
    filter {
      prefix = "logs/"
    }
    expiration {
      days = var.bucket_log_retention_days
    }
    status = "Enabled"
  }
}
