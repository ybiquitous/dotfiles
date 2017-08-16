#!/bin/sh
set -eu

readonly BASEDIR=~/dotfiles

# download if not exists
if [ ! -d "$BASEDIR" ]; then
  git clone https://github.com/ybiquitous/dotfiles.git "$BASEDIR"
fi

cd "$BASEDIR"

# copy files to home directory
find "${BASEDIR}/HOME" -maxdepth 1 -type f | while IFS= read -r file; do
  target_file="${HOME}/$(basename "$file")"
  if [ -f "$target_file" ] && [ ! -L "$target_file" ]; then
    printf "(backup) "
    mv -vf "$target_file" "${target_file}.bak"
  fi

  ln -svf "$file" "$target_file"
done

# prepare ~/bin directory
mkdir -pv ~/bin

# copy files to ~/bin
find "${BASEDIR}/HOME/bin" -maxdepth 1 -type f | while IFS= read -r file; do
  target_file="${HOME}/bin/$(basename "$file")"
  ln -svf "$file" "$target_file"
done

./install/apt.sh
./install/brew.sh
./install/bash-it.sh
./install/diff-highlight.sh
./install/emacs.sh
./install/gem.sh
./install/heroku.sh
./install/npm.sh
./install/nvm.sh
./install/yarn.sh

echo 'Installation completed. Please reopen shell.'
