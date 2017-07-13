#!/bin/bash
set -eu

npm_install="npm install --global --no-progress"

# update npm
echo "Updating npm..."
$npm_install npm@latest

# required packages
echo
echo "Installing required packages..."
$npm_install \
    editorconfig \
    eslint \
    git-open \
    marked \
    stylefmt \
    stylelint \
    tern

# optional packages
echo
echo "Installing optional packages..."
pkgs=" \
msee \
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
echo
npm list --global --depth=0
