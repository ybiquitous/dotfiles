#!/bin/sh
set -eu

BASEDIR=$(cd $(dirname $0); pwd)

# copy files to home directory
for file in $(find "$BASEDIR/HOME" -maxdepth 1 -type f); do
  ln -svf "$file" "$HOME"
done

# prepare ~/bin directory
export BIN_DIR="$HOME/bin"
mkdir -pv $BIN_DIR

"${BASEDIR}/install/apt"
"${BASEDIR}/install/brew"
"${BASEDIR}/install/bash-it"
"${BASEDIR}/install/diff-highlight"
"${BASEDIR}/install/emacs"
"${BASEDIR}/install/heroku"
"${BASEDIR}/install/npm"
"${BASEDIR}/install/nvm"
"${BASEDIR}/install/yarn"

echo 'Installation completed. Please reopen shell.'
