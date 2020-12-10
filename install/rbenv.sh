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

# Install
ruby_version=$(cat "${HOME}/dotfiles/.ruby-version")
rbenv install "$ruby_version" --skip-existing
rbenv global "$ruby_version"
rbenv versions
ruby -v

# Install gems
"${HOME}"/dotfiles/install/gem.sh
