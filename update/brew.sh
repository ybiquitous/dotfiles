#!/bin/bash
set -euo pipefail

if [ -n "$(command -v brew)" ]; then
  brew update
  brew upgrade
  brew doctor --verbose || echo "'brew doctor' exited with $?, but don't stop this process."
  brew cleanup
  brew services restart --all
fi
