#!/usr/bin/env bash

name="${1:-you}"

function main(){
    printf "One for %s, one for me.\n" "$name"
}

main