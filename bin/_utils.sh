#!/bin/bash

function int() { printf '%d' ${1:-} 2>/dev/null || :; }

function validate_port {
    local port_num=$(int "$1")

    if (($port_num < 1 || $port_num > 65535)); then
        echo "${1} is not a valid port"
        exit 1
    fi
}
