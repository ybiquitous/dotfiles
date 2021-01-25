#!/bin/bash
set -euo pipefail

if type brew &>/dev/null ; then
  brew update
  brew upgrade
  brew doctor --verbose || echo "'brew doctor' exited with $?, but don't stop this process."
  brew cleanup
  brew services restart --all
fi
