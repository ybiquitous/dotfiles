#!/bin/bash
set -euo pipefail

dest="${HOME}/.oh-my-zsh"

rm -rf "${dest}"

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "${dest}"

(
  cd "${dest}"/custom/plugins
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
  git clone --depth=1 https://github.com/zsh-users/zsh-completions.git
  git clone --depth=1 https://github.com/lukechilds/zsh-nvm.git
)

(
  cd "${dest}"/custom/themes
  git clone --depth=1 https://github.com/denysdovhan/spaceship-prompt.git
  ln -sv spaceship-prompt/spaceship.zsh-theme spaceship.zsh-theme
)

echo
echo '--- diff begin ---'
diff --unified "${dest}"/templates/zshrc.zsh-template "${HOME}"/.zshrc || true
echo '--- diff end ---'

echo
echo 'Successfully installed Oh-My-Zsh! Please restart the current session.'
