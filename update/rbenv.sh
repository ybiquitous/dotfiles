#!/bin/bash
set -euo pipefail

echo "Updating rbenv and ruby-build..."

rbenv_root="${HOME}/.rbenv"
git -C "${rbenv_root}" pull
git -C "${rbenv_root}"/plugins/ruby-build pull

ruby_version=$(cat "${HOME}/dotfiles/.ruby-version")
rbenv install "$ruby_version" --skip-existing
rbenv global "$ruby_version"
rbenv versions
ruby -v
