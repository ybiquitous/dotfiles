#!/bin/bash
set -eu

# https://brew.sh/index_ja.html
if [[ -z $(command -v brew) ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install \
     bash-completion \
     awscli \
     emacs \
     gibo \
     heroku \
     imagemagick@6 \
     jq \
     mysql \
     postgresql \
     rbenv \
     redis \
     watch
brew upgrade
brew cleanup

GITIGNORE_GLOBAL=~/.gitignore_global
gibo macOS Emacs Ruby Rails Node > $GITIGNORE_GLOBAL
cat <<EOF >> $GITIGNORE_GLOBAL
# Tern.el
.tern-*
EOF
echo "${GITIGNORE_GLOBAL} updated."
