(font-lock-add-keywords 'scss-mode
  '(("$[-[:alnum:]]+" . font-lock-constant-face)))

(defun my/enable-auto-format-on-css ()
  (setq-local js-auto-format-command "prettier")
  (setq-local js-auto-format-command-args "--write >/dev/null"))
(add-hook 'css-mode-hook #'my/enable-auto-format-on-css)
