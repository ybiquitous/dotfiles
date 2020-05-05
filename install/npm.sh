#!/bin/bash
set -euo pipefail

readonly NPM_INSTALL="npm install --global --no-progress"

$NPM_INSTALL npm@latest

$NPM_INSTALL eslint
$NPM_INSTALL ntl
$NPM_INSTALL prettier
$NPM_INSTALL stylelint
$NPM_INSTALL stylelint-config-recommended
$NPM_INSTALL tern
$NPM_INSTALL yarn

npm list --global --depth=0
