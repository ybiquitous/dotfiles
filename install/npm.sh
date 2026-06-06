#!/bin/bash
set -euo pipefail

packages=(
  # built-in
  npm@latest

  # 3rd-party
  @actions/languageserver@latest
  @github/copilot-language-server@latest
  @mermaid-js/mermaid-cli@latest
  skills@latest
  typescript-language-server@latest
  vscode-json-languageserver@latest
)

echo "Installing/updating npm packages globally..."
npm install --global --no-progress "${packages[@]}"

echo
echo "Showing installed npm packages..."
echo
npm list --global --depth=0
