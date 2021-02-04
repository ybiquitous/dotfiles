#!/bin/bash
set -euo pipefail

readonly NVM_DIR="${HOME}/.nvm"

rm -rf "$NVM_DIR"

# shellcheck disable=SC1090
(
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
) && \. "${NVM_DIR}/nvm.sh"

nvm install --lts --latest-npm --default
nvm list
node --version

# Install npm packages
"${HOME}"/dotfiles/install/npm.sh
