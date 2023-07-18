#!/bin/bash
set -euo pipefail

npm -g install npm
echo
echo "npm \"$(npm --version)\" successfully installed"

npm -g update
npm -g ls
echo
echo 'global npm packages successfully updated'

npm -g outdated || echo '' # ignore exit code

npm ci
