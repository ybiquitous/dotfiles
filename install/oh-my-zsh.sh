#!/bin/bash
set -euo pipefail

readonly OH_MY_ZSH="${HOME}/.oh-my-zsh"
readonly OH_MY_ZSH_PLUGINS="${OH_MY_ZSH}/custom/plugins"

rm -rf "${OH_MY_ZSH}"

git clone https://github.com/robbyrussell/oh-my-zsh "${OH_MY_ZSH}"

git clone https://github.com/zsh-users/zsh-autosuggestions "${OH_MY_ZSH_PLUGINS}/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-completions "${OH_MY_ZSH_PLUGINS}/zsh-completions"
git clone https://github.com/lukechilds/zsh-nvm "${OH_MY_ZSH_PLUGINS}/zsh-nvm"

diff "${HOME}/.oh-my-zsh/templates/zshrc.zsh-template" "${HOME}/.zshrc" || true
