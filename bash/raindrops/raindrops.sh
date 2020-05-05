#!/usr/bin/env bash

input="${*//[^[:digit:]]}"

[[ $(( input % 3 )) -eq 0 ]] &&\
    output="${output}Pling"

[[ $(( input % 5 )) -eq 0 ]] &&\
    output="${output}Plang"

[[ $(( input % 7 )) -eq 0 ]] &&\
    output="${output}Plong"

[[ -n "${output}" ]] &&\
    echo "${output}" || echo "$input"
