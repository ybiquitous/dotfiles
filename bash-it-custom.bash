#!/usr/bin/env bash

if [ -t 1 ]; then
  bind '"\C-p":history-search-backward'
  bind '"\C-n":history-search-forward'
fi

alias rm='rm -i'
