#!/bin/sh
set -eu

readonly NPM_INSTALL="npm install --global --no-progress"

# update npm
echo "Updating npm..."
$NPM_INSTALL npm@latest

# required packages
echo
echo "Installing required packages..."
$NPM_INSTALL \
  editorconfig \
  emoj \
  eslint \
  eslint-config-ybiquitous \
  fs-extra \
  git-open \
  markdownlint-cli \
  marked \
  stylelint \
  stylelint-config-standard \
  tern

# HACK: install dependencies of ESLint shareable config
# See details: https://github.com/eslint/eslint/issues/3458
echo
echo "Installing ESLint packages..."
npm_pkgs=$(npm -g view eslint-config-ybiquitous peerDependencies dependencies --json |
             sed 's/[\{\},]//g ; s/: /@/g' |
             grep -v -i 'dependencies' |
             paste -s - |
             tr -d '"')
# shellcheck disable=SC2086
$NPM_INSTALL $npm_pkgs

# optional packages
echo
echo "Installing optional packages..."
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
echo
npm list --global --depth=0
