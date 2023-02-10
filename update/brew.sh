#!/bin/bash
set -euo pipefail

if type brew &>/dev/null ; then
  brew update
  brew upgrade
  brew doctor --verbose || (
    exit_code=$?
    echo
    echo "\"brew doctor\" exited with ${exit_code}, but this process doesn't stop"
  )
  brew cleanup

  echo
  echo 'Run "brew services restart --all" if you need'
fi
