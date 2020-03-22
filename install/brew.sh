#!/bin/sh
set -eu

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
if [ -n "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)" -- --force
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install aspell
brew install awscli
brew install bash
brew install bash-completion
brew install bison
brew install bundler-completion
brew install cmake
brew install colordiff
brew install composer
brew install coreutils
brew install direnv
brew install docker-completion
brew install editorconfig
brew install exercism
brew install ffmpeg
brew install forego
brew install gibo
brew install git-delta
brew install hub
brew install imagemagick
brew install jq
brew install less
brew install mysql
brew install node
brew install php
brew install postgresql
brew install pyenv
brew install rbenv
brew install rbenv-binstubs
brew install redis
brew install ruby
brew install shellcheck
brew install tree
brew install watch
brew install yarn
brew install zsh
brew install github/gh/gh
brew tap heroku/brew && brew install heroku
brew cask install docker
brew cask install emacs
brew cask install google-japanese-ime
brew cask install imageoptim
brew cask install iterm2
brew cask install ngrok
brew cask install sequel-pro
brew cask install wkhtmltopdf
if [ -z "$CI" ]; then
  brew cask install virtualbox
fi
brew tap homebrew/cask-fonts
brew cask install font-hack
brew cask install font-jetbrains-mono
brew cask install font-source-code-pro
brew cleanup

# HACK: `wkhtmltopdf` fails `brew doctor`, which is a known and unresolved issue.
#       See https://github.com/Homebrew/homebrew-cask/issues/24720
brew doctor || echo "'brew doctor' exited with $?, but don't stop this process."

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
