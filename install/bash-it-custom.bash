#!/usr/bin/env bash

if [[ -t 1 ]]; then
  bind '"\C-p":history-search-backward'
  bind '"\C-n":history-search-forward'
fi

alias rm='rm -i'

export EDITOR=emacsclient

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# https://github.com/creationix/nvm/pull/1057
function nvm_use_if_needed () {
  [[ -f .nvmrc ]] && nvm use && return

  [[ -f package.json ]] || return

  local WANTED=$(jq -r '.engines.node' package.json)
  [[ $WANTED == null ]] && nvm use default && return

  local CURRENT=$(hash node 2>/dev/null && node -v | sed 's/v//')
  if [[ $WANTED != $CURRENT ]]; then
    nvm use "$WANTED"
  else
    nvm use default
  fi
}
export PROMPT_COMMAND="$PROMPT_COMMAND ; nvm_use_if_needed"
