#!/bin/bash
set -euo pipefail

if type gh &>/dev/null; then
  # Extensions
  extensions=(
    seachicken/gh-poi
  )
  for extension in "${extensions[@]}"; do
    gh extension install "${extension}"
  done
  gh extension list
fi
