#!/bin/bash
set -euo pipefail

gem update --system
gem update
gem clean
gem list

bundle config set --global path 'vendor/bundle'
bundle config set --global auto_install 'true'

if type brew &>/dev/null; then
  bundle config set --global build.pg "--with-pg-config=${HOMEBREW_PREFIX}/opt/libpq/bin/pg_config"
fi

bundle config
