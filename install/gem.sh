#!/bin/bash
set -euo pipefail

echo '> Updating gems...'
gem update --system
gem update
gem clean
gem list

echo ''
echo '> Setting up Bundler...'
"${HOME}/bin/setup_bundler"
