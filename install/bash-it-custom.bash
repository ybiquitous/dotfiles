#!/usr/bin/env bash

if [[ -t 1 ]]; then
  bind '"\C-p":history-search-backward'
  bind '"\C-n":history-search-forward'
fi

alias rm='rm -i'

export HISTSIZE=100000
export EDITOR=emacsclient
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# https://github.com/creationix/nvm#zsh
# https://github.com/creationix/nvm/pull/1057
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_content=$(< "${nvmrc_path}")
    local nvmrc_node_version=$(nvm version "$nvmrc_content")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      echo "node version '$nvmrc_content' is not installed, please run: 'nvm install'"
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
export PROMPT_COMMAND="$PROMPT_COMMAND ; load-nvmrc"
