#!/bin/sh
set -eu

# get emacs directory
readonly BASEDIR=$(cd "$(dirname "$0")"; pwd)
readonly EMACSDIR="$(dirname "$BASEDIR")/HOME/.emacs.d"

# remove all compiled elisp files
find "$EMACSDIR" -type f -name '*.elc' -exec rm -vf {} +

# link emacs directory to home
ln -svf "$EMACSDIR" ~

# create environment specific file
readonly CONFIG_FILE=~/99_env.el
if [ ! -f "$CONFIG_FILE" ]; then
  cat <<EOF > "$CONFIG_FILE"
;; E.g.
;; (add-to-list 'default-frame-alist '(font . "Ubuntu Mono"))
;; (add-to-list 'default-frame-alist '(top . 0))
;; (add-to-list 'default-frame-alist '(left . 500))
;; (add-to-list 'default-frame-alist '(width . 100))
;; (add-to-list 'default-frame-alist '(height . 35))
EOF
fi

ln -svf "$CONFIG_FILE" ~/.emacs.d/inits
