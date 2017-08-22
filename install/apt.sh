#!/bin/sh
set -eu

if [ -z "$(command -v apt-get)" ]; then
  echo 'apt-get command is not found'
  exit
fi

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
     emacs24 \
     git \
     libffi-dev \
     libgdbm-dev \
     libgdbm3 \
     libncurses5-dev \
     libreadline6-dev \
     libssl-dev \
     libyaml-dev \
     module-assistant \
     terminator \
     tree \
     xclip \
     zlib1g-dev
sudo apt-get clean
sudo apt-get autoremove
sudo apt-get autoclean