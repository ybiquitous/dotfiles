#!/bin/sh
set -eu

if [ -z "$(command -v heroku)" ]; then
  if [ "$(uname -s)" = 'Darwin' ]; then
    echo "Please install 'heroku' by 'brew' in Mac OS X"
  else
    # https://devcenter.heroku.com/articles/heroku-cli#debian-ubuntu
    wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
  fi
fi

# https://github.com/heroku/heroku-cli-autocomplete
heroku update
heroku plugins:install autocomplete
heroku autocomplete
