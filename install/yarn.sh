#!/bin/sh
set -eu

if [ "$(uname -s)" = 'Darwin' ]; then
  echo "Please install 'yarn' by 'brew' in Mac OS X"
else
  echo "See guide: https://yarnpkg.com/en/docs/install"
fi
