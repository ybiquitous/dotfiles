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
if [ -z "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install \
     aspell \
     awscli \
     bash \
     bash-completion \
     cmake \
     colordiff \
     coreutils \
     direnv \
     editorconfig \
     exercism \
     forego \
     gibo \
     heroku \
     hub \
     imagemagick \
     jq \
     md5sha1sum \
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
brew install yarn --without-node
brew cask install \
     emacs \
     google-japanese-ime \
     imageoptim \
     iterm2 \
     recordit \
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
# === Custom ===

# Tern.el
.tern-*

# direnv
.envrc

# foreman / forego
.foreman
.forego
EOT
echo "$GITIGNORE_GLOBAL updated."
