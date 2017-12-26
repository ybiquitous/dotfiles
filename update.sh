#!/bin/sh
set -eu

cat <<EOT
Please update Bash-it manually:

    $ bash-it update
EOT

if [ -n "$(command -v brew)" ]; then
  echo
  echo "Updating brew..."
  brew update
  brew upgrade
  brew cleanup
  brew doctor
  brew cask cleanup
  brew cask outdated
  echo "If there are outdated packages, please run 'brew cask reinstall <package>'."
fi

if [ -n "$(command -v apt-get)" ]; then
  echo
  echo "Updating apt..."
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get autoremove
  sudo apt-get autoclean
  sudo apt-get clean
fi

if [ -n "$NVM_DIR" ]; then
  echo
  echo "Updating nvm..."

  # shellcheck disable=SC1090
  (
    cd "$NVM_DIR"
    git fetch origin
    git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" origin)"
  ) && . "${NVM_DIR}/nvm.sh"
fi

if [ -d "$HOME/.yarn-completion" ]; then
  echo
  echo "Updating yarn-completion..."
  (
    cd "${HOME}/.yarn-completion"
    git pull
  )
fi

echo
echo "Updating npm..."
npm -g update
npm -g outdated || true

echo
echo "Updating gem..."
gem update --system --no-ri --no-rdoc
gem update --no-ri --no-rdoc
gem cleanup
