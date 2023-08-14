#!/bin/bash
set -euo pipefail

if [ -n "$NVM_DIR" ]; then
  (
    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
  )

  # shellcheck source=/dev/null
  \. "${NVM_DIR}/nvm.sh"

  nvm install node --no-progress --latest-npm --reinstall-packages-from="$(nvm current)"
  nvm alias default node
  nvm use default
  nvm ls
  echo "Newly installed Node.js $(node --version) 🎉"
fi
