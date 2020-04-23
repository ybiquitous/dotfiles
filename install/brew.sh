#!/bin/bash
set -euo pipefail

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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# remove all packages
brew list -1 | xargs brew uninstall
brew cask list -1 | xargs brew cask uninstall
brew cleanup

brew install aspell
brew install awscli
brew install bash-completion
brew install bat
brew install bison
brew install bundler-completion
brew install cmake
brew install colordiff
brew install composer
brew install coreutils
brew install direnv
brew install docker-completion
brew install editorconfig
brew install forego
brew install gibo
brew install git-delta
brew install gnugp
brew install hub
brew install imagemagick
brew install jq
brew install less
brew install mysql
brew install postgresql
brew install pyenv
brew install redis
brew install shellcheck
brew install tree
brew install watch
brew install github/gh/gh
brew cask install emacs
brew cask install google-japanese-ime
brew cask install imageoptim
brew cask install iterm2
brew cask install ngrok
brew cask install sequel-pro
brew cask install wkhtmltopdf
brew tap homebrew/cask-fonts
brew cask install font-jetbrains-mono
brew cleanup

# HACK: `wkhtmltopdf` fails `brew doctor`, which is a known and unresolved issue.
#       See https://github.com/Homebrew/homebrew-cask/issues/24720
brew doctor || echo "'brew doctor' exited with $?, but don't stop this process."
brew cask doctor
