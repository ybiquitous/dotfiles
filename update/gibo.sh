#!/bin/bash
set -euo pipefail

if type gibo &>/dev/null ; then
  gibo update
  "${HOME}/dotfiles/install/gibo.sh"
fi
