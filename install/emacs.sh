#!/bin/sh
set -eu

# download
readonly EMACS_DIR="${HOME}/.emacs.d"
rm -rf "$EMACS_DIR"
if [ "$CI" = "true" ]; then
  git clone --depth=1 https://github.com/ybiquitous/.emacs.d.git "$EMACS_DIR"
else
  git clone git@github.com:ybiquitous/.emacs.d.git "$EMACS_DIR"
fi

# customize
readonly CONFIG_FILE="${HOME}/.emacs_env.el"
if [ -f "$CONFIG_FILE" ]; then
  echo "'${CONFIG_FILE}' already exists."
else
  cat <<EOF > "$CONFIG_FILE"
;; (add-to-list 'default-frame-alist '(top . 0))
;; (add-to-list 'default-frame-alist '(left . 500))
;; (add-to-list 'default-frame-alist '(width . 100))
;; (add-to-list 'default-frame-alist '(height . 35))
EOF
fi
