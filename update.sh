#!/bin/bash
set -euo pipefail

readonly BASEDIR="${HOME}/dotfiles"

"${BASEDIR}/update/brew.sh"
"${BASEDIR}/update/apt.sh"

if [ -n "$NVM_DIR" ]; then
  # shellcheck disable=SC1090
  (
    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
  ) && \. "${NVM_DIR}/nvm.sh"
fi

npm -g update
npm -g outdated || echo '' # ignore exit code

"${BASEDIR}/update/rbenv.sh"
"${BASEDIR}/update/gem.sh"
"${BASEDIR}/update/gibo.sh"
"${BASEDIR}/update/oh-my-zsh.sh"
