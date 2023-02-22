#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

function script_usage() {
    cat <<EOF
Usage:
     -h|--help                Displays this help
     --port-fix               Run with port-fixer (Incorrect port detected for hosted server)
EOF
}

function parse_params() {
    port_fix=false

    local param
    while [[ $# -gt 0 ]]; do
        param="$1"
        shift
        case $param in
        -h | --help)
            script_usage
            exit 0
            ;;
        --port-fix)
            port_fix=true
            ;;
        *)
            script_exit "Invalid parameter was provided: $param" 1
            ;;
        esac
    done
}

cd $(dirname "$0")/..

parse_params "$@"

service_count=$(docker ps -q -f status=running -f name=^/factorio | wc -l)
if ([ "$port_fix" == true ] && [ $service_count -eq 2 ]) || ([ "$port_fix" = false ] && [ $service_count -eq 1 ]); then
    echo "Factorio server is already running"
    exit 0
fi

if [ ! -d './data' ]; then
    mkdir -p ./data
    sudo chown 845:845 ./data
fi

if [ "$port_fix" = true ]; then
    docker-compose -f factorio-pf.yml up -d
else
    docker-compose -f factorio.yml up -d --remove-orphans
fi
