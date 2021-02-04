#!/bin/bash
set -euo pipefail

readonly BASEDIR="${HOME}/dotfiles"

"${BASEDIR}/update/brew.sh"
"${BASEDIR}/update/apt.sh"
"${BASEDIR}/update/nvm.sh"

npm -g update
npm -g outdated || echo '' # ignore exit code

"${BASEDIR}/update/rbenv.sh"
"${BASEDIR}/update/gem.sh"
"${BASEDIR}/update/gibo.sh"
"${BASEDIR}/update/oh-my-zsh.sh"
