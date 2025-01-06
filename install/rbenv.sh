#!/bin/bash
set -euo pipefail

rbenv_root="${HOME}/.rbenv"

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." &>/dev/null && pwd)"

# Clean
rm -rf "${rbenv_root}"

# Install
git clone https://github.com/rbenv/rbenv.git "${rbenv_root}"
cd "${rbenv_root}"
src/configure
make -C src

# Install ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git "${rbenv_root}/plugins/ruby-build"

# Install ruby-default-gems plugin
git clone https://github.com/rbenv/rbenv-default-gems.git "${rbenv_root}/plugins/rbenv-default-gems"
ln -svf "${root}/install/default-gems" "${rbenv_root}"

# Setup shell
export PATH="${rbenv_root}/bin:${PATH}"
if ! type rbenv &>/dev/null ; then
  echo "rbenv is not in PATH. Try reopening the terminal."
  exit 1
fi
eval "$(rbenv init -v)"
rbenv rehash

# Verify
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash

# Install
ruby_version=$(< "${root}/.ruby-version")
rbenv install "${ruby_version}" --skip-existing
rbenv global "${ruby_version}"
rbenv versions
ruby -v

# Set up gems
"${root}/install/gem.sh"
