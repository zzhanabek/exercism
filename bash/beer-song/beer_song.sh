#!/usr/bin/env bash


start="${1}"
end="${2}"

[[ -z "$end" ]] \
    && end="${start}"

{ [[ $# -eq 0 ]] || [[ $# -gt 2 ]]; } \
    && echo "1 or 2 arguments expected" \
    && exit 1

[[ $start -lt $end ]] \
    && echo "Start must be greater than End" \
    && exit 1

for (( bottles="${start}"; bottles >= "${end}"; bottles--));do
    bottles_left="$(( bottles - 1 ))"
    if [[ "${bottles}" -le 2 ]];then
        plural="bottle"
    else
        plural="bottles"
    fi
    
    bottles_song="${bottles} bottles of beer on the wall, ${bottles} bottles of beer.
Take one down and pass it around, ${bottles_left} ${plural} of beer on the wall.\n"
    
    if [[ ${bottles} -eq 1 ]];then
        bottles_song="1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.\n"
    elif [[ ${bottles} -eq 0 ]];then
        bottles_song="No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall."
    fi
    
    echo -e "${bottles_song}"
done