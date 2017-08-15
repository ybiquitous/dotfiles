#!/bin/sh
set -eu

cat <<EOT
Please update Bash-it manually:

    bash-it update

EOT

if [ -n "$(command -v brew)" ]; then
  echo "brew updating..."
  brew update && brew upgrade && brew cleanup
  echo
fi

echo "npm updating..."
npm -g outdated || true
npm -g update
echo

(cd ~ ; gem update)
