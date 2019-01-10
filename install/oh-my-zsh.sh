#!/bin/sh
set -eux

git clone https://github.com/robbyrussell/oh-my-zsh.git "${HOME}/.oh-my-zsh"

diff "${HOME}/.oh-my-zsh/templates/zshrc.zsh-template" "${HOME}/.zshrc" || true
