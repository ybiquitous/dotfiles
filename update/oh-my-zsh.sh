#!/bin/sh
set -eu

readonly PLUGINS=$(find "${HOME}/.oh-my-zsh/custom/plugins" -type d -depth 1 | grep -v example)

for plugin in $PLUGINS; do
  (cd "${plugin}" && echo "Updating ${plugin} ..." && git pull --no-verbose)
done

echo "The update is done. Please restart Zsh."
