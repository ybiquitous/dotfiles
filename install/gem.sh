#!/bin/bash
set -euo pipefail

gem update --system
gem update

# gem install <gem>...
gem clean
gem list

bundle config set --global path 'vendor/bundle'

if type brew &>/dev/null; then
  bundle config set --global build.pg "--with-pg-config=${HOMEBREW_PREFIX}/opt/libpq/bin/pg_config"
fi

bundle config
