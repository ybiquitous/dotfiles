#!/bin/bash
set -euo pipefail

git_clone () {
  git clone --depth=1 --quiet --recurse-submodules "$@"
}

readonly env="${HOME}/.zshrc.env"
if [[ -f $env ]]; then
  echo "'${env}' already exists."
else
  cat <<EOF > "${env}"
# Customize functions or variables for a specific environment. For example:
# export PATH="/Applications/Firefox.app/Contents/MacOS:${PATH}"
# export BROWSER=firefox
EOF
  chmod 0600 "${env}"
  echo "'${env}' is created."
fi

echo
echo '> Installing zsh plugins...'
readonly zsh_dir="${HOME}/.zsh"
mkdir -p "${zsh_dir}"

if [[ -d "${zsh_dir}/zsh-autosuggestions" ]]; then
  echo "zsh-autosuggestions already installed."
else
  git_clone https://github.com/zsh-users/zsh-autosuggestions.git "${zsh_dir}/zsh-autosuggestions"
  echo "zsh-autosuggestions installed."
fi
