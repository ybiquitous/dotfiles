#!/usr/bin/env bash

if [[ -t 1 ]]; then
  bind '"\C-p":history-search-backward'
  bind '"\C-n":history-search-forward'
fi

alias rm='rm -i'

export HISTFILE="${HOME}/.bash_history"
export HISTSIZE=100000
export EDITOR=emacsclient
export PATH="${HOME}/.yarn/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"
