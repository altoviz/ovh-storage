#!/bin/sh

echo Docker build

if [ -f ./credentials.sh ]; then
  . ./credentials.sh
fi

docker build ./process -t ovh-storage