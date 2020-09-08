#!/bin/bash
set -euo pipefail

readonly install="npm install --global --no-progress"

$install npm@latest

$install eslint
$install javascript-typescript-langserver
$install np
$install ntl
$install prettier
$install typescript-language-server
$install yarn

npm list --global --depth=0
