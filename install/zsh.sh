#!/bin/bash
set -euo pipefail

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
