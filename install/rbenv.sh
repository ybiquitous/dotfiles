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
git clone https://github.com/rbenv/ruby-build.git "${dest}/plugins/ruby-build"

# Install ruby-default-gems plugin
git clone https://github.com/rbenv/rbenv-default-gems.git "${dest}/plugins/rbenv-default-gems"
ln -svf "${HOME}/dotfiles/install/default-gems" "${dest}"

# Setup shell
export PATH="${dest}:${PATH}"
if ! type rbenv &>/dev/null ; then
  echo "rbenv is not in PATH. Try reopening the terminal."
  exit 1
fi
eval "$(rbenv init -v)"
rbenv rehash

# Verify
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash

# Install
ruby_version=$(< "${HOME}/dotfiles/.ruby-version")
rbenv install "${ruby_version}" --skip-existing
rbenv global "${ruby_version}"
rbenv versions
ruby -v

# Set up gems
"${HOME}/dotfiles/install/gem.sh"
