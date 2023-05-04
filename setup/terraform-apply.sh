#!/bin/sh

terraform apply
echo $(terraform output s3_bucket || true)
echo $(terraform output s3_region || true)