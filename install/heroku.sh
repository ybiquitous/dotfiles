#!/bin/sh
set -eu

if [ "$(uname -s)" = 'Darwin' ]; then
  echo "Please install 'heroku' by 'brew' in Mac OS X"
  exit
fi

if [ -n "$(command -v heroku)" ]; then
  heroku --version
  exit
fi

# https://devcenter.heroku.com/articles/heroku-cli#debian-ubuntu
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
