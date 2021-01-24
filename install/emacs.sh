#!/bin/bash
set -euo pipefail

# download
readonly dest="${HOME}/.emacs.d"
rm -rf "${dest}"
git clone https://github.com/ybiquitous/.emacs.d.git "${dest}"

# customize
readonly init_env="${HOME}/.emacs-env.el"
if [[ -f $init_env ]]; then
  echo "'${init_env}' already exists."
else
  cat <<EOF > "${init_env}"
;; (add-to-list 'default-frame-alist '(top . 0))
;; (add-to-list 'default-frame-alist '(left . 500))
;; (add-to-list 'default-frame-alist '(width . 100))
;; (add-to-list 'default-frame-alist '(height . 35))

;; (set-face-font 'default "JetBrains Mono 14")
EOF
  echo "'${init_env}' is created."
fi
