#!/bin/bash
set -euo pipefail

if type apt-get &>/dev/null ; then
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get autoremove
  sudo apt-get autoclean
  sudo apt-get clean
fi
