#!/bin/sh
set -eu

readonly NPM_INSTALL="npm install --global --no-progress"

set -x

# update npm
$NPM_INSTALL npm@latest

# required packages
$NPM_INSTALL \
  alex \
  emoj \
  eslint \
  fs-extra \
  markdownlint-cli \
  marked \
  prettier \
  stylelint \
  stylelint-config-standard \
  tern \
  tslint \
  tslint-config-prettier \
  tslint-plugin-prettier \
  tslint-react \
  typescript \
  typings \
  write-good

# optional packages
npm_pkgs="
msee
sitespeed.io
svgo"
opt_pkgs=""

for pkg in $npm_pkgs; do
  printf "> Install '%s'? [y/N] " "$pkg"
  read -r answer
  case $answer in
    [Yy]* ) opt_pkgs="$opt_pkgs $pkg" && echo "yes" ;;
    * ) ;;
  esac
done

if [ -n "$opt_pkgs" ]; then
  # shellcheck disable=SC2086
  $NPM_INSTALL $opt_pkgs
fi

# show installed packages
npm list --global --depth=0
