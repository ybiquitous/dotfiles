#!/bin/bash
set -euo pipefail

if ! type fnm &>/dev/null; then
  echo "fnm not found. Install with: brew install fnm"
  exit 1
fi

fnm install --latest
fnm default latest
fnm list
node --version

# Install npm packages
"${HOME}"/dotfiles/install/npm.sh
