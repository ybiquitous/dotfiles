#!/bin/sh
set -eu

# https://yarnpkg.com/en/docs/install#alternatives-tab

if [ -d ~/.yarn ]; then
  cat <<EOT

Yarn is installed already:

   $(command -v yarn)

If you want to reinstall, please run following command:

   rm -rf ~/.yarn
EOT
else
  readonly DUMMY_PROFILE=/tmp/yarn-dummy-profile
  touch $DUMMY_PROFILE
  curl -o- -L https://yarnpkg.com/install.sh | PROFILE=$DUMMY_PROFILE bash
  rm -rf $DUMMY_PROFILE
  rm -rf ~/.config/yarn
fi
