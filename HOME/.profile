#!/usr/bin/env bash

if [[ -t 1 ]]; then
  bind '"\C-p":history-search-backward'
  bind '"\C-n":history-search-forward'
fi

alias rm='rm -i'

export HISTFILE="${HOME}/.bash_history"
export HISTSIZE=100000
export EDITOR=emacsclient
export PATH="${HOME}/bin:${HOME}/node_shims:${HOME}/.yarn/bin:${PATH}"

if [[ -n $(command -v npm) ]]; then
  export NODE_PATH=$(npm root -g)
fi
