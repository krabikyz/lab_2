#!/bin/bash

get_max_number() {
  max_number=0
  for file in $(ls | grep -E "^Krabikyz[0-9]+$"); do
    number=$(echo "$file" | grep -oE "[0-9]+")
    if (( number > max_number )); then
      max_number=$number
    fi
  done
  echo "$max_number"
}

generate_file_names() {
  max_number=$(get_max_number)
  file_names=()
  for (( i = 1; i <= 25; i++ )); do
    file_name="Krabikyz$(( max_number + i ))"
    file_names+=("$file_name")
  done
  echo "${file_names[@]}"
}

create_files() {
  file_names=($(generate_file_names))
  for file_name in "${file_names[@]}"; do
    touch "$file_name"
  done
}

create_files
