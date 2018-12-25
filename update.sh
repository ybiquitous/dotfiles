#!/bin/sh
set -eu

readonly BASEDIR="${HOME}/dotfiles"

cat <<EOT
Please update Bash-it manually:

    $ bash-it update

Please update Prezto manually:

    $ zprezto-update
EOT

if [ -n "$(command -v brew)" ]; then
  echo
  echo "Updating brew..."
  brew update
  brew upgrade
  brew cask upgrade
  brew doctor || echo "'brew doctor' exited with $?, but don't stop this process."
  brew cleanup
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
gem update --system --no-document
gem update --no-document
gem cleanup

echo
echo "Updating gibo..."
gibo update
"${BASEDIR}/install/gibo.sh"
