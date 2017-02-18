#!/usr/bin/env bash

if [ -t 1 ]; then
  bind '"\C-p":history-search-backward'
  bind '"\C-n":history-search-forward'
fi

alias rm='rm -i'

# Auto-enabled .nvmrc in project
# https://github.com/creationix/nvm/pull/1057
function nvm_use_if_needed () {
  [[ -r ./.nvmrc  && -s ./.nvmrc ]] || return
  WANTED=$(sed 's/v//' < ./.nvmrc)
  CURRENT=$(hash node 2>/dev/null && node -v | sed 's/v//')
  if [ "$WANTED" != "$CURRENT" ]; then
      nvm use
  fi
}
export PROMPT_COMMAND="$PROMPT_COMMAND ; nvm_use_if_needed"
