#!/bin/sh

echo "Copying data"
rclone -v sync /data/ ovh:$OVH_S3_BUCKET
