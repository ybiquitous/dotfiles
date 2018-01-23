(font-lock-add-keywords 'scss-mode
  '(("$[-[:alnum:]]+" . font-lock-constant-face)))

(defun my/css-mode-hook ()
  (add-node-modules-path)
  (setq-local flycheck-disabled-checkers '(scss-lint))
  (setq-local js-auto-format-command "prettier")
  (setq-local js-auto-format-command-args "--write"))
(add-hook 'css-mode-hook #'my/css-mode-hook)
