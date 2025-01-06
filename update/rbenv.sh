#!/bin/bash
set -euo pipefail

echo "Updating rbenv and ruby-build..."

rbenv_root="$(rbenv root)"
git -C "${rbenv_root}" pull --quiet
git -C "${rbenv_root}/plugins/ruby-build" pull --quiet

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." &>/dev/null && pwd)"
ruby_version=$(< "${root}/.ruby-version")
rbenv install "${ruby_version}" --skip-existing
rbenv global "${ruby_version}"
rbenv versions

echo
echo "Default Ruby version set by rbenv:"
ruby -v
