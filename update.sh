#!/bin/sh
set -eu

cat <<EOT
Please update Bash-it manually:

    bash-it update

EOT

if [ -n "$(command -v brew)" ]; then
  echo "brew updating..."
  brew update && brew upgrade && brew cleanup && brew cask cleanup
  echo
fi

echo "npm updating..."
npm -g update
npm -g outdated || true
echo

(cd ~ ; gem update)
