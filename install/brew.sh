#!/bin/bash
set -euo pipefail

if [ "$(uname -s)" != 'Darwin' ]; then
  echo 'brew is unsupported in this platform'
  exit
fi

if ! type xcode-select &>/dev/null ; then
  cat <<'EOT'
Please install Xcode from App Store, then run the following command:

  $ xcode-select --install

Please see https://docs.brew.sh/Installation.html for more details.
EOT
  exit 1
fi

# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# remove all packages
brew list -1 | xargs brew uninstall
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
brew install fswatch
brew install fzf
brew install gh
brew install gibo
brew install git
brew install git-delta
brew install gnupg
brew install hadolint
brew install imagemagick
brew install jq
brew install less
brew install mysql
brew install pinentry-mac
brew install postgresql
brew install pyenv
brew install redis
brew install shellcheck
brew install tree
brew install watch
brew install --cask emacs
brew install --cask google-japanese-ime
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask ngrok
brew install --cask wkhtmltopdf
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono
brew cleanup

# HACK: `wkhtmltopdf` fails `brew doctor`, which is a known and unresolved issue.
#       See https://github.com/Homebrew/homebrew-cask/issues/24720
brew doctor --verbose || echo "'brew doctor' exited with $?, but don't stop this process."
