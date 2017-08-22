#!/bin/sh
set -eu

readonly NVM_VERSION=v0.33.2

# https://github.com/creationix/nvm#install-script

if [ ! -d ~/.nvm ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh |
    PROFILE=/tmp/nvm_dummpy_profile bash
else
  echo "nvm is installed already"
fi