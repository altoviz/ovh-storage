#!/bin/sh

docker run -itd \
  -e OVH_S3_ACCESS_KEY_ID=$OVH_S3_ACCESS_KEY_ID \
  -e OVH_S3_SECRET_ACCESS_KEY=$OVH_S3_SECRET_ACCESS_KEY \
  -e OVH_S3_BUCKET=$OVH_S3_BUCKET \
  -e OVH_S3_REGION=$OVH_S3_REGION \
  -v $(dirname "$(pwd)")/data:/data \
  --name ovh-storage \
  ovh-storage
