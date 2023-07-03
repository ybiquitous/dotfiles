#!/bin/bash
set -euo pipefail

plugins=$(find "${HOME}/.oh-my-zsh/custom/plugins" -type d -depth 1 | grep -v example)
for plugin in $plugins; do
  (
    cd "${plugin}"
    echo
    echo "> Updating plugin \"$(basename "${plugin}")\"..."
    git pull --no-verbose
  )
done

themes=$(find "${HOME}/.oh-my-zsh/custom/themes" -type d -depth 1 | grep -v example)
for theme in $themes; do
  (
    cd "${theme}"
    echo
    echo "> Updating theme \"$(basename "${theme}")\"..."
    git pull --no-verbose
  )
done

echo
echo 'Run "omz update && omz reload" to complete updating Oh My Zsh'
