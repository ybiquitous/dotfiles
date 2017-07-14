#!/bin/sh
set -eu

BASEDIR="${HOME}/dotfiles"

# download if not exists
if [ ! -d "$BASEDIR" ]; then
  git clone https://github.com/ybiquitous/dotfiles.git "$BASEDIR"
fi

cd "$BASEDIR"

# copy files to home directory
for file in $(find ./HOME -maxdepth 1 -type f); do
  ln -svf "$file" "$HOME"
done

# prepare ~/bin directory
mkdir -pv "${HOME}/bin"

"./install/apt"
"./install/brew"
"./install/bash-it"
"./install/diff-highlight"
"./install/emacs"
"./install/heroku"
"./install/npm"
"./install/nvm"
"./install/yarn"

echo 'Installation completed. Please reopen shell.'
