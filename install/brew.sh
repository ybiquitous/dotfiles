#!/bin/sh
set -eux

if [ "$(uname -s)" != 'Darwin' ]; then
  echo 'brew is unsupported in this platform'
  exit
fi

if [ -z "$(command -v xcode-select)" ]; then
  cat <<'EOT'
Please install Xcode from App Store, then run the following command:

  $ xcode-select --install

Please see https://docs.brew.sh/Installation.html for more details.
EOT
  exit 1
fi

# https://brew.sh
if [ -z "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install \
     aspell \
     awscli \
     bash \
     bash-completion \
     bundler-completion \
     cmake \
     colordiff \
     coreutils \
     direnv \
     docker-completion \
     editorconfig \
     exercism \
     forego \
     gibo \
     hub \
     imagemagick \
     jq \
     less \
     mysql \
     node \
     postgresql \
     rbenv \
     rbenv-binstubs \
     redis \
     ruby \
     shellcheck \
     tree \
     watch \
     zsh \
     zsh-completions
brew install yarn --without-node
brew install heroku/brew/heroku
brew cask install \
     docker \
     emacs \
     google-japanese-ime \
     imageoptim \
     iterm2 \
     sequel-pro \
     virtualbox \
     font-hack \
     font-source-code-pro
brew upgrade
brew doctor
brew cleanup

# Bash
readonly BREW_BASH=$(brew --prefix)/bin/bash
if grep -q "$BREW_BASH" /etc/shells; then
  sudo sh -c "echo $BREW_BASH >> /etc/shells"
  # chsh -s "$BREW_BASH"
  # echo "Changed login shell to $BREW_BASH"
fi

# Zsh
readonly BREW_ZSH=$(brew --prefix)/bin/zsh
if grep -q "$BREW_ZSH" /etc/shells; then
  sudo sh -c "echo $BREW_ZSH >> /etc/shells"
  chsh -s "$BREW_ZSH"
  echo "Changed login shell to $BREW_ZSH"
fi
