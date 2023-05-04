#!/bin/sh

echo Docker logs

if [ -f ./credentials.sh ]; then
  . ./credentials.sh
fi

docker logs ovh-storage --follow