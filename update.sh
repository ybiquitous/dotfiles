#!/bin/bash
set -euo pipefail

readonly BASEDIR="${HOME}/dotfiles"

"${BASEDIR}/update/brew.sh"

if type apt-get &>/dev/null ; then
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
    git fetch --tags origin
    git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
  ) && \. "${NVM_DIR}/nvm.sh"
fi

if [ -d "$HOME/.yarn-completion" ]; then
  (
    cd "${HOME}/.yarn-completion"
    git pull
  )
fi

npm -g update
npm -g outdated || echo '' # ignore exit code

"${BASEDIR}/update/rbenv.sh"
"${BASEDIR}/update/gem.sh"
"${BASEDIR}/update/gibo.sh"
"${BASEDIR}/update/oh-my-zsh.sh"
