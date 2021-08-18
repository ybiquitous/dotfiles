#!/bin/bash
set -euo pipefail

readonly install="npm install --global --no-progress"

$install npm@latest

$install ntl
$install prettier
$install yarn

npm list --global --depth=0
