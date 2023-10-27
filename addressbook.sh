#!/bin/bash

case "$1" in
  "new")
    name="$2"
    email="$3"
    echo "$name $email" >> addressbook.txt
    ;;
  "list")
    if [[ -s "addressbook.txt" ]]; then
      cat addressbook.txt
    else
      echo "Addressbook is empty"
    fi
    ;;
  "remove")
    name="$2"
    grep -v "$name" addressbook.txt > temp.txt
    mv temp.txt addressbook.txt
    ;;
  "clear")
    rm -f addressbook.txt
    ;;
  "lookup")
    name="$2"
    grep "$name" addressbook.txt
    ;;
  *)
    echo "Invalid command"
    ;;
esac
