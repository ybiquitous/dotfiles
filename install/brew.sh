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
     aspell \
     bash \
     bash-completion \
     awscli \
     editorconfig \
     exercism \
     gibo \
     heroku \
     hub \
     imagemagick \
     jq \
     mysql \
     node \
     postgresql \
     rbenv \
     redis \
     ruby \
     shellcheck \
     tree \
     watch \
     homebrew/dupes/less
brew cask install \
     emacs \
     imageoptim \
     iterm2 \
     sequel-pro \
     virtualbox \
     caskroom/fonts/font-hack
brew upgrade
brew cleanup
brew doctor
brew cask cleanup

# Bash
readonly BREW_BASH=$(brew --prefix)/bin/bash
if grep -q "$BREW_BASH" /etc/shells; then
  sudo sh -c "echo $BREW_BASH >> /etc/shells"
  chsh -s "$BREW_BASH"
  echo "Changed login shell to $BREW_BASH"
fi

# setup gibo
readonly GITIGNORE_GLOBAL=~/.gitignore_global
gibo macOS Emacs Ruby Rails Node > "$GITIGNORE_GLOBAL"
cat <<EOT >> "$GITIGNORE_GLOBAL"
# Tern.el
.tern-*
EOT
echo "$GITIGNORE_GLOBAL updated."
