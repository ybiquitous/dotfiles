#!/bin/bash
set -euo pipefail

if type gh &>/dev/null; then
  # Extensions
  extensions=()
  for extension in "${extensions[@]+"${extensions[@]}"}"; do
    gh extension install "${extension}"
  done
  gh extension list
fi
