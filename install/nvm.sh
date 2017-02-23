#!/bin/bash
set -eu

NVM_VERSION=v0.33.0

# https://github.com/creationix/nvm#install-script
if [[ ! -d ~/.nvm ]]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | PROFILE="/tmp/nvm_dummpy_profile" bash
fi
