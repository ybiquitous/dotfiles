#!/bin/bash
set -euo pipefail

if type gh &>/dev/null; then
  # Create a extension list and install all the extensions
  extensions=(
    seachicken/gh-poi
  )
  for extension in "${extensions[@]}"; do
    gh extension install "${extension}"
  done

  gh extension list
fi
