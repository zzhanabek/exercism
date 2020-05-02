#!/usr/bin/env bash

set -o pipefail

usage="Usage: $0 <mutiple words>"

# ${var^^} makes uppercase
# 
text="${*^^}"           &&\
    [[ -z "$text" ]]    &&\
    echo "$usage"       &&\
    exit 1              ; 

function chars_processing(){
    # https://stackoverflow.com/questions/28554923/print-first-letter-of-each-word-in-a-line
    ( sed -E -e "s/'//" -e  "s,[[:punct:]],\ ,g" \
    | awk '{
        for (i=1; i<=NF; i++) {
            printf(substr($i, 1, 1));
        }
        printf("\n");
    }')
}

chars_processing <<< "$text"