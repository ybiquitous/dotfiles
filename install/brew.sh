#!/bin/sh
set -eu

if [ "$(uname -s)" != 'Darwin' ]; then
  echo 'brew is unsupported in this platform'
  exit
fi

# https://brew.sh
if [ -z "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install \
     bash-completion \
     awscli \
     gibo \
     heroku \
     imagemagick \
     jq \
     mysql \
     node \
     postgresql \
     rbenv \
     redis \
     shellcheck \
     watch
brew cask install \
     emacs \
     imageoptim \
     sequel-pro \
     virtualbox
brew upgrade
brew cleanup

# setup gibo
readonly GITIGNORE_GLOBAL=~/.gitignore_global
gibo macOS Emacs Ruby Rails Node > "$GITIGNORE_GLOBAL"
cat <<EOT >> "$GITIGNORE_GLOBAL"
# Tern.el
.tern-*
EOT
echo "$GITIGNORE_GLOBAL updated."
