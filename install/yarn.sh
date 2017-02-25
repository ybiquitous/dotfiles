#!/bin/bash
set -eu

# https://yarnpkg.com/en/docs/install#alternatives-tab
if [[ ! -d ~/.yarn ]]; then
  dummy_profile=/tmp/yarn-dummy-profile
  touch $dummy_profile
  curl -o- -L https://yarnpkg.com/install.sh | PROFILE=$dummy_profile bash
  rm -rf $dummy_profile
  rm -rf ~/.config/yarn
fi