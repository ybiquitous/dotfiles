#!/bin/bash
set -euo pipefail

readonly install="npm install --global --no-progress"

$install npm@latest

npm list --global --depth=0
