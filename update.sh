#!/bin/bash
set -euo pipefail

readonly BASEDIR="${HOME}/dotfiles"

"${BASEDIR}/update/brew.sh"
"${BASEDIR}/update/apt.sh"
"${BASEDIR}/update/nvm.sh"
"${BASEDIR}/update/npm.sh"
"${BASEDIR}/update/rbenv.sh"
"${BASEDIR}/update/gem.sh"
"${BASEDIR}/update/gibo.sh"
"${BASEDIR}/update/oh-my-zsh.sh"
