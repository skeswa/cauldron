#! /bin/bash

# Localize some location info
scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
base_dir="$(dirname "$(dirname "$scripts_dir")")"

rm -rf "$base_dir/web/dist"
