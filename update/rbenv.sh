#!/bin/bash
set -euo pipefail

echo "Updating rbenv and ruby-build..."

rbenv_root="${HOME}/.rbenv"
git -C "${rbenv_root}" pull
git -C "${rbenv_root}"/plugins/ruby-build pull
