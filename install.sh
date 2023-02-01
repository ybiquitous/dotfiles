#!/bin/bash
set -euo pipefail

readonly BASEDIR="${HOME}/dotfiles"

# download if not exists
if [ ! -d "$BASEDIR" ]; then
  git clone https://github.com/ybiquitous/dotfiles.git "$BASEDIR"
fi

cd "$BASEDIR"

# copy files to ~/
find "${BASEDIR}/HOME" -maxdepth 1 -type f | while IFS= read -r file; do
  target_file="${HOME}/$(basename "$file")"
  if [ -f "$target_file" ] && [ ! -L "$target_file" ]; then
    printf "(backup) "
    mv -vf "$target_file" "${target_file}.bak"
  fi

  ln -svf "$file" "$target_file"
done

# copy files to ~/bin/
mkdir -pv "${HOME}/bin"
find "${BASEDIR}/HOME/bin" -maxdepth 1 -type f | while IFS= read -r file; do
  ln -svf "$file" "${HOME}/bin/$(basename "$file")"
done

# copy directories to ~/.config/
mkdir -pv "${HOME}/.config"
find "${BASEDIR}/HOME/.config" -maxdepth 1 -type d ! -path "${BASEDIR}/HOME/.config" | while IFS= read -r dir; do
  ln -svf "$dir" "${HOME}/.config/$(basename "$dir")"
done

./install/apt.sh
./install/brew.sh
./install/oh-my-zsh.sh
./install/emacs.sh
./install/gibo.sh
./install/nvm.sh
./install/rbenv.sh

echo 'Installation completed. Please reopen shell.'
