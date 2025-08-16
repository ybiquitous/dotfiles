#!/bin/bash
set -euo pipefail

readonly dest="${HOME}/.oh-my-zsh"

git_clone () {
  git clone --depth=1 --quiet "$@"
}

echo '> Installing Oh My Zsh...'
rm -rf "${dest}"
git_clone https://github.com/ohmyzsh/ohmyzsh.git "${dest}"

echo
echo '> Installing custom plugins...'
(
  cd "${dest}/custom/plugins"
  git_clone https://github.com/zsh-users/zsh-autosuggestions.git
  git_clone https://github.com/zsh-users/zsh-completions.git
)

echo
echo '> Installing custom themes...'
(
  cd "${dest}/custom/themes"
  # Add themes if you want...
)

echo
echo '### DIFF BEGIN - .zshrc ###'
diff --unified "${dest}"/templates/zshrc.zsh-template "${HOME}"/.zshrc || true
echo '### DIFF END - .zshrc ###'

echo
echo 'Successfully installed Oh My Zsh!'

exec zsh
