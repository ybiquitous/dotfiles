# cli.exercism.io
if [[ -n $(command -v exercism) ]]; then
  if [[ ! -d ~/.config/exercism ]]; then
    mkdir -p ~/.config/exercism
    echo "Downloading exercism_completion.bash..."
    curl -s http://cli.exercism.io/exercism_completion.bash > ~/.config/exercism/exercism_completion.bash
  fi
  if [[ -f ~/.config/exercism/exercism_completion.bash ]]; then
    # shellcheck source=/dev/null
    . ~/.config/exercism/exercism_completion.bash
  fi
fi

# https://github.com/creationix/nvm#zsh
# https://github.com/creationix/nvm/pull/1057
load-nvmrc() {
  command -v nvm >/dev/null || return

  local node_version
  node_version="$(nvm version)"

  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [[ -n $nvmrc_path ]]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(< "$nvmrc_path")")

    if [[ $nvmrc_node_version = "N/A" ]]; then
      nvm install
    elif [[ $nvmrc_node_version != "$node_version" ]]; then
      nvm use
    fi
  elif [[ $node_version != "$(nvm version default)" ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
export PROMPT_COMMAND="${PROMPT_COMMAND}; load-nvmrc"
