#!/bin/sh
set -eu

# https://yarnpkg.com/en/docs/install#alternatives-tab

if [ -d ~/.yarn ]; then
  echo
  echo 'Yarn is installed already:'
  echo
  echo "   $(command -v yarn)"
  echo
  echo 'If you want to reinstall, please run following command:'
  echo
  echo '   rm -rf ~/.yarn'
else
  dummy_profile=/tmp/yarn-dummy-profile
  touch $dummy_profile
  curl -o- -L https://yarnpkg.com/install.sh | PROFILE=$dummy_profile bash
  rm -rf $dummy_profile
  rm -rf ~/.config/yarn
fi
