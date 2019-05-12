#!/bin/sh
set -eu

readonly NPM_INSTALL="npm install --global --no-progress"

# Update npm
$NPM_INSTALL npm@latest

# Required packages
$NPM_INSTALL eslint
$NPM_INSTALL prettier
$NPM_INSTALL stylelint
$NPM_INSTALL stylelint-config-standard
$NPM_INSTALL tern
$NPM_INSTALL tslint
$NPM_INSTALL typescript

# Installed packages
npm list --global --depth=0
