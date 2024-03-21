#!/bin/bash

# used to count all the errors
acc=0

for file in $(find . -iname "*yaml" -o -iname "*.yml" | grep deployment); do
  # we use xargs to trim result value, otherwise it will be ' "value"'
  manifest_path=$(grep "manifest_path" "$file" | cut -f2 -d ":" | xargs)
  if [ "$manifest_path" != "" ]; then
    if [ ! -f "$manifest_path" ]; then
      echo "$file has defined $manifest_path but this path doesn't exist"
      acc=$((acc + 1))
    fi

    file=$(echo "$file" | sed 's/\.\///')

    if [ "$manifest_path" != "$file" ]; then
      echo "manifest_path: [$manifest_path] doesn't match with [$file]"
      acc=$((acc + 1))
    fi
  else
    echo "$file doesn't have a manifest_path configured"
  fi
done

if [ "$acc" -gt "0" ]; then
  exit 1
fi
