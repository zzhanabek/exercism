#!/usr/bin/env bash

input="${*,,}"
input="${input//[^a-zA-Z]/}"
input="${input/.//}"

function get_letters(){
	for (( i=0; i<${#input}; i++)); do
		letters+="${input:$i:1} "
	done
	echo -e "${letters}"
}

function main(){
	declare -A map
	mapfile -t letters < <(get_letters)
	for letter in ${letters[*]}; do
		for i in $letter; do
			(( map[$i]++ ))
		done
	done
	for key in "${!map[@]}"; do
		if [[ "${map[$key]}" -gt 1 ]]; then
			non_isogram+=1
		fi
	done
	if [[ $non_isogram -gt 0 ]]; then
		echo "false"
	elif [[ -z $non_isogram ]]; then
		echo "true"
	fi
}

main