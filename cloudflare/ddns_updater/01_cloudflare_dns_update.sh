#!/bin/bash

for f in *.example.com.sh; do
  if [ "$f" == "$0" ]; then
    continue
  else
    echo "running: $f"
        bash "$f"
  fi
done
