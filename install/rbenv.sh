#!/bin/bash
set -euo pipefail

dest="${HOME}/.rbenv"

# Install
git clone https://github.com/rbenv/rbenv.git "$dest"
cd "$dest"
src/configure
make -C src

# Install ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git "${dest}"/plugins/ruby-build

echo "To verify the installation, run the following command:"
echo ""
echo "    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash"
echo ""
