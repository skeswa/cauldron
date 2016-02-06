#! /bin/bash

# Localize some location info
scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
base_dir="$(dirname "$(dirname "$scripts_dir")")"
tmp_dir="$base_dir/cli/.tmp-$(date +"%s")"
# Link up with the default docker machine
eval $(docker-machine env default)
# Move into the cli src folder
mkdir -p "$tmp_dir"
cd "$tmp_dir"
cp -a "$base_dir/cli/src/." .
# Spin up the go container to compile our src
docker run \
  --rm \
  -v "$PWD":/usr/src/cauldron \
  -w /usr/src/cauldron \
  tcnksm/gox:1.5 && \
  # If that worked, create the dist folder
  mkdir -p ../dist && \
  # If that worked, move the compiled executable to the dist folder
  mv ./cauldron_* ../dist
# Get rid of the tmp dir
cd ..
rm -rf "$tmp_dir"
