#!/bin/bash

cd $(dirname "$0")/..

docker stop factorio &>/dev/null
docker rm factorio &>/dev/null
docker pull factoriotools/factorio
docker-compose up -d
