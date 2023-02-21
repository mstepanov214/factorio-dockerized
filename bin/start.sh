#!/bin/bash

ROOT=$(dirname "$0")/..
cd $ROOT

# name='factorio'

# if [ "$(docker ps -q -f status=running -f name=^/${name}$)" ]; then
#     echo "Server is already running"
#     exit 0
# fi

if [ ! -d './data' ]; then
    mkdir -p ./data
    sudo chown 845:845 ./data
fi

# if [ ! -f './server-settings.json' ]; then
#     wget https://raw.githubusercontent.com/wube/factorio-data/master/server-settings.example.json -O server-settings.json -q
# fi

docker-compose up -d
