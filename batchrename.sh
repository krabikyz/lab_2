#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <directory> <original_extension> <new_extension>"
  exit 1
fi

# List all files with the original extension
files=$(ls "$1"/*."$2")

# Rename files with the new extension
for file in $files; do
  if [[ "${file##*.}" != "$2" ]]; then
    continue
  fi
  new_file="${file%.$2}.$3"
  mv "$file" "$new_file"
  echo "Перейменовую $file на $new_file"
done
