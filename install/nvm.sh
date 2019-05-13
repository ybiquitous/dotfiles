#!/bin/sh
set -eu

readonly NVM_DIR="${HOME}/.nvm"

rm -rf "$NVM_DIR"

# shellcheck disable=SC1090
(
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" origin)"
) && . "${NVM_DIR}/nvm.sh"
