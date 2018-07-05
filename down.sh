#!/bin/bash

# script to stop and delete docker container
docker container rm --force npm-offline 2> /dev/null
