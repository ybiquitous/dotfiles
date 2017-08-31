#!/bin/sh
set -eu

echo "Updating system gem..."
gem update --system

echo
echo "Installing gems..."
gem install --no-ri --no-rdoc \
    bundler \
    mdl \
    reek \
    rubocop

echo
gem update

echo
gem list
