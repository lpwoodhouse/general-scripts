#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
files=("$script_dir"/*.example.com.sh)
if (( ${#files[@]} == 0 )); then
    printf '%s\n' 'No matching record scripts found.' >&2
    exit 1
fi
for file in "${files[@]}"; do
    printf 'Running %s\n' "$(basename -- "$file")"
    bash "$file"
done
