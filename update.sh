#!/bin/sh
set -eu

echo "Please update Bash-it update manually:"
echo
echo "    bash-it update"
echo

if [ -n "$(command -v brew)" ]; then
  echo "brew updating..."
  brew update && brew upgrade && brew cleanup
fi

echo "npm updating..."
npm -g outdated || true
npm -g update
