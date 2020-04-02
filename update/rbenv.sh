#!/bin/bash
set -euo pipefail

cd "${HOME}/.rbenv"
git pull

cd plugins/ruby-build
git pull
