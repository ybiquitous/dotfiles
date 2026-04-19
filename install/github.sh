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

  # Skills (Claude Code)
  skills=(
    "JuliusBrussee/caveman caveman"
    "JuliusBrussee/caveman caveman-commit"
  )
  for skill in "${skills[@]}"; do
    # shellcheck disable=SC2086
    gh skill install ${skill} --agent claude-code --scope user --force
  done
fi
