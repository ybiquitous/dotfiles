#!/bin/bash
set -euo pipefail

if [ -n "$NVM_DIR" ]; then
  # shellcheck disable=SC1090
  (
    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
  ) && \. "${NVM_DIR}/nvm.sh"

  nvm install --lts --latest-npm --default
  node --version
fi
