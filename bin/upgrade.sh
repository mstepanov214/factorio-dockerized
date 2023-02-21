#!/bin/bash

ROOT=$(dirname "$0")/..
cd $ROOT

docker stop factorio &>/dev/null
docker rm factorio &>/dev/null
docker pull factoriotools/factorio
docker-compose up -d
