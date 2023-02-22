#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

cd $(dirname "$0")/..

service_count=$(docker ps -q -f status=running -f name=^/factorio | wc -l)

docker stop factorio &>/dev/null
docker rm factorio &>/dev/null
docker pull factoriotools/factorio

if [ $service_count -eq 2 ]; then
    docker-compose -f factorio-pf.yml up -d
elif [ $service_count -eq 1 ]; then
    docker-compose -f factorio.yml up -d --remove-orphans
fi
