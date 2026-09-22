#!/bin/bash
set -euo pipefail

if ! type fnm &>/dev/null; then
  echo "fnm not found. See https://github.com/Schniz/fnm"
  exit 1
fi

eval "$(fnm env)"

fnm install --latest

system_node="$(find /opt /usr -type f -name 'node' -path '*/bin/node' -perm +111 2>/dev/null || true)"
if [[ -n "${system_node}" ]]; then
  fnm default system
else
  fnm default latest
fi

fnm list

node --version

# Install npm packages
"${HOME}"/dotfiles/install/npm.sh
