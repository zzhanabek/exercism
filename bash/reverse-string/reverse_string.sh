#!/usr/bin/env bash

input="${*}"

{ [[ -z "$input" ]] || [[ $# -gt 1 ]]; } && exit 0;

for (( i=${#input} ; i>=0; i--)); do
   reversed+="${input:$i:1}"
done
echo "$reversed"
