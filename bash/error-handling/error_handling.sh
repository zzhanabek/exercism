#!/usr/bin/env bash

set -e

name="${@}"
arguments_count=${#}
error="Usage: error_handling.sh <person>"

if [[ "$arguments_count" -gt 1 ]] \
|| [[ "$arguments_count" -lt 1 ]]; then
    echo "$error"
    exit 1 
fi
echo "Hello, $name"