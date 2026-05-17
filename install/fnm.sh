#!/bin/bash
set -euo pipefail

if ! type fnm &>/dev/null; then
  echo "fnm not found. See https://github.com/Schniz/fnm"
  exit 1
fi

fnm install --latest --use
fnm default latest
fnm list
node --version

# Install npm packages
"${HOME}"/dotfiles/install/npm.sh
