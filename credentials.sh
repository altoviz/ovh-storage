#!/bin/sh

crendentials_private=$(echo $0 | sed -e "s/.sh/-private.sh/g")
if [ -f $crendentials_private ]; then
  . $crendentials_private 
fi

export OVH_APPLICATION_KEY=${OVH_APPLICATION_KEY_PRIVATE}
export OVH_APPLICATION_SECRET=${OVH_APPLICATION_SECRET_PRIVATE}
export OVH_CONSUMER_KEY=gra

prev_cd=$(pwd)
cd setup
export OVH_ENDPOINT="ovh-eu"
export OVH_S3_ACCESS_KEY_ID=$(terraform output s3_access_key_id || true)
export OVH_S3_SECRET_ACCESS_KEY=$(terraform output s3_secret_access_key || true)
export OVH_S3_BUCKET=$(terraform output s3_bucket || true)
export OVH_S3_REGION=$(terraform output s3_region || true)
cd $prev_cd