#!/bin/sh
set -eu

readonly NPM_INSTALL="npm install --global --no-progress"

echo "Updating system gem..."
gem update --system

echo
echo "Installing gems..."
gem install \
    mdl \
    reek \
    rubocop

echo
gem update

echo
gem list
