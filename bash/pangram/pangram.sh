#!/usr/bin/env bash

input="${*,,}"
input="${input//[^a-zA-Z]/}"
input="${input/.//}"

[ -z "$input" ]     &&\
    echo "false"    &&\
    exit 0;
# set alfa
for letters in {a..z}; do
    alfa+=$letters
done

while [ -n "$input" ] && [ -n "$alfa" ]; do
    letter="${input%%${input#?}}"
    input="${input#?}"
    alfa=${alfa/$letter}
done
if [[ -z "$alfa" ]]; then 
    echo true
else
    echo false
fi
