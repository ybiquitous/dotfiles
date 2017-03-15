#!/bin/bash
set -eu

# https://brew.sh/index_ja.html
if [[ -z $(command -v brew) ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install \
     bash-completion
     awscli \
     emacs \
     heroku \
     imagemagick@6 \
     jq \
     mysql \
     postgresql \
     rbenv \
     redis
