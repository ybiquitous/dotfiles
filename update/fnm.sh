#!/bin/bash
set -euo pipefail

if type fnm &>/dev/null; then
  current_version=$(fnm current)

  fnm install --latest
  fnm default latest
  fnm use default

  new_version="$(fnm current)"
  if [[ "${current_version}" != "${new_version}" ]]; then
    echo "✅Updated from ${current_version} to ${new_version}"
  fi

  fnm list
  echo ''
  printf 'The default Node.js version: \x1b[1m%s\x1b[0m\n' "$(node --version)"
fi
