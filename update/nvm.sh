#!/bin/bash
set -euo pipefail

if [ -n "$NVM_DIR" ]; then
  # shellcheck disable=SC1090
  (
    cd "$NVM_DIR"
    git fetch --tags origin
    # TODO: Waiting for the next release.
    # See https://github.com/nvm-sh/nvm/commit/fe6268c021a18068c23e96535d4a468746d3c6cf
    git pull
    git checkout master
    # git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
  ) && \. "${NVM_DIR}/nvm.sh"

  nvm install node --latest-npm
  nvm alias default node
  nvm use default
  node --version
fi
