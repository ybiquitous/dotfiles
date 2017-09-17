(add-hook 'js-mode-hook
  (lambda ()
    (setq
      js-indent-level tab-width
      js-switch-indent-offset tab-width)))

(use-package js2-mode
  :bind (:map js2-mode-map
          ("C-c i" . js-doc-insert-function-doc))
  :mode "\\.js\\'"
  :interpreter "node"
  :config
  (add-hook 'js2-mode-hook 'flyspell-prog-mode)
  (setq
    js2-basic-offset tab-width
    js2-mode-show-parse-errors nil
    js2-mode-show-strict-warnings nil))

(use-package tern
  :config
  (add-hook 'js2-mode-hook 'tern-mode))

(use-package company-tern
  :config
  (push 'company-tern company-backends))

(use-package rjsx-mode
  :mode (("components\\/.*\\.jsx?\\'" . rjsx-mode)
          ("\\.jsx\\'" . rjsx-mode))
  :config
  (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
  (flycheck-mode))

(use-package json-mode
  :mode (("\\.tern-config\\'" . json-mode)
          ("\\.tern-project\\'" . json-mode)
          ("\\.babelrc\\'" . json-mode)
          ("\\.eslintrc\\'" . json-mode)
          ("\\.stylelintrc\\'" . json-mode))
  :config
  (setq
    json-mode-indent-level tab-width))

;; install js-auto-format-mode
(unless (package-installed-p 'js-auto-format-mode)
  (url-copy-file "https://raw.githubusercontent.com/ybiquitous/js-auto-format-mode/master/js-auto-format-mode.el" "js-auto-format-mode.el" t)
  (package-install-file "js-auto-format-mode.el")
  (delete-file "js-auto-format-mode.el"))
