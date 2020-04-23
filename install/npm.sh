#!/bin/sh
set -eu

readonly NPM_INSTALL="npm install --global --no-progress"

# Update npm
$NPM_INSTALL npm@latest

# Required packages
$NPM_INSTALL eslint
$NPM_INSTALL ntl
$NPM_INSTALL prettier
$NPM_INSTALL stylelint
$NPM_INSTALL stylelint-config-recommended
$NPM_INSTALL tern

# Installed packages
npm list --global --depth=0 || true # suppress exit code 1
