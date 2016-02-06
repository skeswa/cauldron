#! /bin/bash

# Localize some location info
scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
base_dir="$(dirname "$(dirname "$scripts_dir")")"
src_dir="$base_dir/cli/src"
target_dir="$base_dir/cli/dist"
tmp_file="cauldron-tmp-$(date +"%s")"
tmp_dir="$GOPATH/src/$tmp_file"

mkdir -p "$tmp_dir"
cd "$tmp_dir"
cp -a "$src_dir/." .
echo "Building CLI from source..."
go get -d -v && \
  go build && \
  mkdir -p "$target_dir" && \
  mv "./$tmp_file" "$target_dir/cauldron" && \
  echo "Built CLI successfully!"
cd "$base_dir"
rm -rf "$tmp_dir"
