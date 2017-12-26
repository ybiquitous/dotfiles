#!/bin/sh
set -eu

readonly NVM_VERSION=$(curl -s https://api.github.com/repos/creationix/nvm/releases |
                         jq -r 'map(select(.draft==false) | .name) | first')

echo "Installing nvm ${NVM_VERSION}..."

if [ ! -d "${HOME}/.nvm" ]; then
  readonly DUMMY_PROFILE="${TMPDIR}/nvm_dummy_profile"
  touch "$DUMMY_PROFILE"

  # https://github.com/creationix/nvm#install-script
  curl -s -o- "https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh" |
    PROFILE="$DUMMY_PROFILE" bash

  rm -f "$DUMMY_PROFILE"
else
  echo "nvm is installed already"
fi
