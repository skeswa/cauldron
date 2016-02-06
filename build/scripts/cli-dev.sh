#! /bin/bash

# Localize some location info
scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
base_dir="$(dirname "$(dirname "$scripts_dir")")"
# Watch the CLI source code directory
echo "Now watching CLI source directory..."
fswatch -r -o "$base_dir/cli/src" | xargs -n1 "$scripts_dir/cli-build.sh"
