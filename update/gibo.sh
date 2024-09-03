#!/bin/bash
set -euo pipefail

if type gibo &>/dev/null ; then
  echo "Updating gibo..."

  if ! gibo update; then
    echo "Updating gibo failed. Removing cache and retrying update..."
    rm -rf "$(gibo root)"
    gibo update
  fi

  "${HOME}/dotfiles/install/gibo.sh"
fi
