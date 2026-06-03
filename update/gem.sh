#!/bin/bash
set -euo pipefail

echo '> Updating gems...'
gem update --system
gem update
gem cleanup
gem outdated

echo ''
echo '> Setting up Bundler...'
"${HOME}/bin/setup_bundler"
