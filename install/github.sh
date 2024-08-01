#!/bin/bash
set -euo pipefail

if type gh &>/dev/null; then
  gh extension install dlvhdr/gh-dash
  gh dash --version
fi
