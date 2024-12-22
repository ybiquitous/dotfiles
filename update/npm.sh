#!/bin/bash
set -euo pipefail

npm -g install npm
echo
echo "✅ Successfully installed npm \"$(npm --version)\" "

npm -g update
npm -g ls
echo
echo '✅ Successfully updated global npm packages'

npm -g outdated || echo '' # ignore exit code

(
  cd "$(dirname "${BASH_SOURCE[0]}")/.."
  npm ci
  echo
  echo "✅ Successfully updated local npm packages in ${PWD}"
)
