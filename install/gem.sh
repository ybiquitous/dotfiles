#!/bin/bash
set -euo pipefail

gem update --system
gem update

# gem install <gem>...
gem clean
gem list

bundle config --global path 'vendor/bundle'
bundle config
