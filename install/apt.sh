#!/bin/bash
set -euo pipefail

if ! type apt-get &>/dev/null ; then
  echo '"apt-get" command is not found. skip.'
  exit
fi

# Node.js
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Git
sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install \
     apt-transport-https \
     autoconf \
     bison \
     build-essential \
     ca-certificates \
     curl \
     emacs \
     git \
     libffi-dev \
     libgdbm-dev \
     libgdbm3 \
     libncurses5-dev \
     libreadline6-dev \
     libssl-dev \
     libyaml-dev \
     module-assistant \
     nodejs \
     rbenv \
     ruby \
     ruby-build \
     terminator \
     tree \
     xclip \
     yarn \
     zlib1g-dev \
     zsh
sudo apt-get clean
sudo apt-get autoremove
sudo apt-get autoclean
