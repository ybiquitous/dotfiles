#!/bin/sh
set -eu

cat <<EOT
Please update Bash-it update manually:

    bash-it update

EOT

if [ -n "$(command -v brew)" ]; then
  echo "brew updating..."
  brew update && brew upgrade && brew cleanup
fi

echo "npm updating..."
npm -g outdated || true
npm -g update
