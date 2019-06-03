#!/bin/sh
set -eu

readonly BASEDIR="${HOME}/dotfiles"

if [ -n "$(command -v brew)" ]; then
  brew update
  brew upgrade
  brew cask upgrade
  brew doctor || echo "'brew doctor' exited with $?, but don't stop this process."
  brew cleanup
fi

if [ -n "$(command -v apt-get)" ]; then
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get autoremove
  sudo apt-get autoclean
  sudo apt-get clean
fi

if [ -n "$NVM_DIR" ]; then
  # shellcheck disable=SC1090
  (
    cd "$NVM_DIR"
    git fetch origin
    git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" origin)"
  ) && . "${NVM_DIR}/nvm.sh"
fi

if [ -d "$HOME/.yarn-completion" ]; then
  (
    cd "${HOME}/.yarn-completion"
    git pull
  )
fi

npm -g update
npm -g outdated || echo '' # ignore exit code

gem update --system --no-document
gem update --no-document
gem cleanup

gibo update
"${BASEDIR}/install/gibo.sh"

"${BASEDIR}/update/oh-my-zsh.sh"
