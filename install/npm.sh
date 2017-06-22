#!/bin/bash
set -eu

npm_install="npm install --global --no-progress"

# upgrade npm
$npm_install npm@latest

# required packages
$npm_install \
    editorconfig \
    eslint \
    git-open \
    marked \
    stylefmt \
    stylelint \
    tern

# optional packages
pkgs=" \
flow-bin \
msee \
npm-check \
sitespeed.io \
svgo \
"

opt_pkgs=""

for pkg in $pkgs; do
  read -p "> Install '$pkg'? [y/N] " answer
  case $answer in
    [Yy]* ) opt_pkgs="$opt_pkgs $pkg" && echo "yes" ;;
    * ) ;;
  esac
done

if [ -n "$opt_pkgs" ]; then
  $npm_install $opt_pkgs
fi

# show installed packages
npm list --global --depth=0
