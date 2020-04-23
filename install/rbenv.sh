#!/bin/bash
set -euo pipefail

dest="${HOME}/.rbenv"

# Clean
rm -rf "$dest"

# Install
git clone https://github.com/rbenv/rbenv.git "$dest"
cd "$dest"
src/configure
make -C src

# Install ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git "${dest}"/plugins/ruby-build

# Setup shell
export PATH=${dest}:${PATH}
eval "$(rbenv init -v)"
rbenv rehash

# Verify
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# Install the latest Ruby
ruby_version=$(rbenv install --list | grep -E '^2.7.' | tail -1)
rbenv install "$ruby_version"
rbenv global "$ruby_version"
rbenv versions
ruby -v

# Install gems
current_dir=$(cd "$(dirname "$0")" && pwd)
"${current_dir}"/gem.sh
