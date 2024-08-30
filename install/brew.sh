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

# set PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# remove all packages
brew list -1 | xargs brew uninstall
brew cleanup

brew install actionlint
brew install aspell
brew install atuin
brew install bash-completion
brew install bat
brew install bison
brew install bundler-completion
brew install cmake
brew install cmark-gfm
brew install colordiff
brew install coreutils
brew install curl
brew install direnv
brew install docker-completion
brew install dust
brew install editorconfig
brew install fd
brew install ffmpeg
brew install forego
brew install fswatch
brew install fzf
brew install gh
brew install gibo
brew install git
brew install git-delta
brew install gnupg
brew install hadolint
brew install jenv
brew install jq
brew install less
brew install libyaml
brew install most
brew install pinentry-mac
brew install ripgrep
brew install rust-analyzer
brew install rustup-init
brew install shellcheck
brew install tree
brew install watch
brew install yt-dlp
brew install --cask dash
brew install --cask emacs
brew install --cask google-japanese-ime
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask keycastr
brew install --cask musescore
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-jetbrains-mono
brew cleanup
brew doctor
