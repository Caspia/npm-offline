#!/bin/sh

# start npm-offline

./down.sh

#include the local .env if we are not running under BELUGA, and it exists.
if [ -z "$BELUGA" ] && [ -f ./.env ] ; then
  echo "Using .env file from npm-offline directory"
  . ./.env
else
  echo "Not using .env file from npm-offline directory"
fi

# NPM_OFFLINE_CONFIGFILE can be one of two values: "configOffline.yaml" (the default) or "configOnline.yaml".
#
# If set to configOnline.yaml, then any missing modules will be loaded from the public, internet-based
# npm registry.
#
# If set to config-offline.yaml, then any missing modules result in an error return. No attempt is made
# to locate them on the internet.
#

# Only override the Dockerfile environment variable if defined.
if [ -z "$OFFLINE" ]; then
  CONFIGFILE=configOnline.yaml
  docker build -t caspia/verdaccio:latest .
else
  CONFIGFILE=configOffline.yaml
fi

docker run -d --restart=always -p "4873:4873" --name npm-offline --network="beluga" -e "VIRTUAL_HOST=npm-offline.ed" -e "VIRTUAL_PORT=4873" -e "CONFIGFILE=$CONFIGFILE" $NPM_OFFLINE_VOLUME caspia/verdaccio:latest 
