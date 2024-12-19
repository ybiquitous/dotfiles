#!/bin/bash
set -euo pipefail

if type gh &>/dev/null; then
  gh extension install github/gh-copilot
  gh copilot --version

  gh extension install dlvhdr/gh-dash
  gh dash --version
fi
