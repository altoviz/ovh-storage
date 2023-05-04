#!/bin/sh

echo Docker run

if [ -f ./credentials.sh ]; then
  . ./credentials.sh
fi

container_name="ovh-storage"
if [ $(docker ps -a -q -f name=$container_name) ]; then
  echo Removing existing container instance
  docker stop $container_name
  docker rm $container_name
fi
docker run -itd \
  -e OVH_S3_ACCESS_KEY_ID=$OVH_S3_ACCESS_KEY_ID \
  -e OVH_S3_SECRET_ACCESS_KEY=$OVH_S3_SECRET_ACCESS_KEY \
  -e OVH_S3_BUCKET=$OVH_S3_BUCKET \
  -e OVH_S3_REGION=$OVH_S3_REGION \
  -v $(dirname "$(pwd)")/data:/data \
  --name $container_name \
  $container_name
