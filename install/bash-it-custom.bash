#!/usr/bin/env bash

# shellcheck disable=SC1090
. ~/.profile

# https://github.com/creationix/nvm#zsh
# https://github.com/creationix/nvm/pull/1057
load-nvmrc() {
  command -v nvm >/dev/null || return

  local node_version
  node_version="$(nvm version)"

  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_content
    nvmrc_content=$(< "${nvmrc_path}")

    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$nvmrc_content")

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

# Simple workaround for Heroku completion (see https://github.com/heroku/cli/issues/224)
_heroku_completions() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($(compgen -W "help $(heroku help | tail -n +4)" -- "$cur"))
}
complete -F _heroku_completions heroku

# cli.exercism.io
if [ -n "$(command -v exercism)" ]; then
  if [ ! -d ~/.config/exercism ]; then
    mkdir -p ~/.config/exercism
    echo "Downloading exercism_completion.bash..."
    curl -s http://cli.exercism.io/exercism_completion.bash > ~/.config/exercism/exercism_completion.bash
  fi
  if [ -f ~/.config/exercism/exercism_completion.bash ]; then
    . ~/.config/exercism/exercism_completion.bash
  fi
fi
