#!/bin/bash
find . -type f -exec dos2unix {} \;

cd "$(dirname "$0")" || exit

for i in */*.sh; do
  echo "$i"
  bash "$i" "$1"
done

find . -type f -exec dos2unix {} \;
