#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

source "$(dirname "${BASH_SOURCE[0]}")/_utils.sh"

function script_usage() {
    cat <<EOF

Usage:  $BASH_SOURCE [OPTIONS]

Start Factorio server

Options:
     -h, --help                Display this help
     -p, --port                UDP port the server listens on (default 34197)
         --port-fix            Run with port-fixer (if incorrect port detected for hosted server)
EOF
}

function parse_params() {
    port_fix=false
    port=34197

    local param
    while [[ $# -gt 0 ]]; do
        param="$1"
        shift
        case $param in
        -h | --help)
            script_usage
            exit 0
            ;;
        -p | --port)
            validate_port $1
            port=$1
            shift
            ;;
        --port-fix)
            port_fix=true
            ;;
        *)
            echo "Invalid parameter was provided: $param"
            exit 1
            ;;
        esac
    done
}

cd $(dirname "$0")/..

parse_params "$@"

# service_count=$(docker ps -q -f status=running -f name=^/factorio | wc -l)
# if ([ "$port_fix" = true ] && [ $service_count -eq 2 ]) || ([ "$port_fix" = false ] && [ $service_count -eq 1 ]); then
#     echo "Factorio server is already running"
#     exit 0
# fi

if [ ! -d './data' ]; then
    mkdir -p ./data
    sudo chown 845:845 ./data
fi

echo "PORT=$port" >.env

if [ "$port_fix" = true ]; then
    docker-compose -f factorio-pf.yml up -d
else
    docker-compose -f factorio.yml up -d --remove-orphans
fi
