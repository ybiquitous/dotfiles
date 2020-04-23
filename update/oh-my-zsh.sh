#!/bin/bash
set -euo pipefail

plugins=$(find "${HOME}/.oh-my-zsh/custom/plugins" -type d -depth 1 | grep -v example)
for plugin in $plugins; do
  (cd "${plugin}" && echo "Updating plugin $(basename "${plugin}") ..." && git pull --no-verbose)
done

themes=$(find "${HOME}/.oh-my-zsh/custom/themes" -type d -depth 1 | grep -v example)
for theme in $themes; do
  (cd "${theme}" && echo "Updating theme $(basename "${theme}") ..." && git pull --no-verbose)
done

echo "The update of Oh-My-ZSH completed. Please restart Zsh."
