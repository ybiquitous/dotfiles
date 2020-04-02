#!/bin/bash
set -euo pipefail

readonly IGNORE_FILES=$(gibo dump macOS Emacs)
readonly GITIGNORE_GLOBAL="${HOME}/.gitignore_global"

cat <<EOF >"${GITIGNORE_GLOBAL}.new"
${IGNORE_FILES}

### Custom

# Tern.el
.tern-*

# direnv
.envrc

# foreman / forego
.foreman
.forego

# Bundler
vendor/bundle/.bin/
vendor/bundle/ruby/
EOF

set +e
diff -u "$GITIGNORE_GLOBAL" "${GITIGNORE_GLOBAL}.new"
diff_exit_code=$?
set -e
case $diff_exit_code in
  0)
    echo "No changes: ${GITIGNORE_GLOBAL}"
    ;;
  1)
    echo ""
    mv -v "${GITIGNORE_GLOBAL}.new" "$GITIGNORE_GLOBAL"
    ;;
  *)
    exit $diff_exit_code
    ;;
esac
