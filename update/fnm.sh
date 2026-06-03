#!/usr/bin/env bash
set -euo pipefail

if type fnm &>/dev/null; then
  eval "$(fnm env)"
  fnm use default
  current_version=$(fnm current)

  global_packages=()
  if type npm &>/dev/null; then
    mapfile -t global_packages < <(npm list --global --depth=0 --json --silent | jq -r '.dependencies | keys[] | select(. != "npm")')
  fi

  fnm install --latest --use
  fnm default latest

  new_version="$(fnm current)"
  if [[ "${current_version}" != "${new_version}" ]]; then
    printf '✅ Updated from %s to \x1b[36m%s\x1b[0m\n' "${current_version}" "${new_version}"

    if [[ ${#global_packages[@]} -gt 0 ]]; then
      echo "Installing global npm packages..."
      npm install --global "${global_packages[@]}"
      echo ''
      npm list --global
    fi
  fi

  fnm list
  echo ''
  printf '✅ The default Node.js version is installed: \x1b[36m%s\x1b[0m\n' "$(node --version)"
  printf 'To apply it, run: \x1b[36m%s\x1b[0m\n' "fnm use default"
  printf 'To remove the old version, run: \x1b[36m%s\x1b[0m\n' "fnm uninstall ${current_version}"
fi
