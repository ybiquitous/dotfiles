#!/bin/bash
set -eu

BASEDIR=$(cd $(dirname $0);pwd)

# https://github.com/Bash-it/bash-it#install
if [[ ! -d ~/.bash_it ]]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

  ~/.bash_it/install.sh

  ln -svf "${BASEDIR}/bash-it-custom.bash" ~/.bash_it/custom

  echo
  echo "Add next line to ~/.bashrc or ~/.bash_profile:"
  echo
  echo "  export BASH_IT_THEME='mbriggs'"
  echo

  exit
fi

bash-it enable plugin \
        alias-completion \
        base \
        git \
        history \
        node \
        nvm \
        rails \
        rbenv \
        ruby

if [[ $(uname -s) == Darwin ]]; then
  bash-it enable plugin osx
fi

bash-it enable completion \
        bash-it \
        brew \
        bundler \
        defaults \
        gem \
        git \
        npm \
        nvm \
        projects \
        rake \
        system
