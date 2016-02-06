#! /bin/bash

# Localize some location info
scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
base_dir="$(dirname "$(dirname "$scripts_dir")")"
# Ensure that the dist folder exists
mkdir -p "$base_dir/web/dist"
# Start webpack
NODE_ENV=dev \
  "$base_dir/node_modules/webpack/bin/webpack.js" \
  --config "$base_dir/build/webpack-dev.config.js" \
  --watch \
  --quiet &
  # Also start an HTTP server for the web assets
  "$base_dir/node_modules/local-web-server/bin/cli.js" \
  -p 3000 \
  -d "$base_dir/web/dist" && \
  echo "Dev server is running on port 3000."
