#!/bin/bash
set -euo pipefail

echo "Current Node.js version: $(node --version)"
echo

echo "🔄 Installing the latest npm version..."
npm -g install npm
echo
echo "✅ Successfully installed npm \"$(npm --version)\" "
echo

echo "🔄 Updating global npm packages..."
npm -g update
npm -g ls
echo
echo '✅ Successfully updated global npm packages'
echo

npm -g outdated || echo '' # ignore exit code

(
  cd "$(dirname "${BASH_SOURCE[0]}")/.."
  echo "🔄 Fresh-installing local npm packages..."
  npm ci --loglevel=error
  echo
  echo "✅ Successfully fresh-installed local npm packages in ${PWD}"
)
