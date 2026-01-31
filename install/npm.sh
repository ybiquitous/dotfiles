#!/bin/bash
set -euo pipefail

echo "Installing/updating npm packages globally..."
readonly install="npm install --global --no-progress"
$install \
  npm@latest \
  @actions/languageserver@latest \
  @github/copilot-language-server@latest \
  typescript-language-server@latest \
  vscode-json-languageserver@latest

echo
echo "Showing installed npm packages..."
echo
npm list --global --depth=0
