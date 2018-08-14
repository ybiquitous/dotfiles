#!/bin/sh
set -eu

readonly IGNORE_FILES=$(gibo dump macOS Emacs)

readonly GITIGNORE_GLOBAL="${HOME}/.gitignore_global"

rm -f "$GITIGNORE_GLOBAL"

cat <<EOT >"$GITIGNORE_GLOBAL"
${IGNORE_FILES}

### Custom

# Tern.el
.tern-*

# direnv
.envrc

# foreman / forego
.foreman
.forego
EOT

echo "$GITIGNORE_GLOBAL updated."