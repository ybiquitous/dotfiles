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

if [ -n "$(command -v apt-get)" ]; then
  echo "apt updating..."
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get autoremove
  sudo apt-get autoclean
  sudo apt-get clean
fi

echo "npm updating..."
npm -g update
npm -g outdated || true
echo

(cd ~ ; gem update --system ; gem update --no-ri --no-rdoc)
