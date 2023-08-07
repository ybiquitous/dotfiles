#!/bin/bash
set -euo pipefail

plugins=$(find "${HOME}/.oh-my-zsh/custom/plugins" -type d -depth 1 | grep -v example)
for plugin in $plugins; do
  (
    cd "${plugin}"
    echo
    printf '> Updating plugin \x1b[1m%s\x1b[0m...\n' "$(basename "${plugin}")"
    git pull --no-verbose
  )
done

themes=$(find "${HOME}/.oh-my-zsh/custom/themes" -type d -depth 1 | grep -v example)
for theme in $themes; do
  (
    cd "${theme}"
    echo
    printf '> Updating theme \x1b[1m%s\x1b[0m...\n' "$(basename "${theme}")"
    git pull --no-verbose
  )
done

echo
printf 'To complete updating Oh My Zsh, run: \x1b[1;33m%s\x1b[0m\n' 'omz update && omz reload'
