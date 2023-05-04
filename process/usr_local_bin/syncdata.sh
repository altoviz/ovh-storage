#!/bin/sh

echo "Synchronizing data"
ls -la /data/
rclone -v sync /data/ ovh:$OVH_S3_BUCKET
