#!/bin/sh

echo "Configuring Rclone"
rclone config update ovh \
  access_key_id=$OVH_S3_ACCESS_KEY_ID \
  secret_access_key=$OVH_S3_SECRET_ACCESS_KEY \
  endpoint=https://s3.$OVH_S3_REGION.io.cloud.ovh.net \
  region=$OVH_S3_REGION location_constraint=$OVH_S3_REGION \
  > /dev/nul 2>&1
echo "Starting Cron"
cat /tmp/crontab > /etc/crontabs/root
# Foreground LogLevel 8
/usr/sbin/crond -f -l 8