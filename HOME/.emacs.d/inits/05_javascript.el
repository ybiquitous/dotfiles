(use-package tern
  :ensure t
  :init (add-hook 'js2-mode-hook 'tern-mode))

(use-package company-tern
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern))

(use-package js-mode
  :config
  (setq
    js-indent-level tab-width
    js-switch-indent-offset tab-width))

(use-package js2-mode
  :ensure t
  :bind (:map js2-mode-map
          ("C-c i" . js-doc-insert-function-doc))
  :mode "\\.js$"
  :interpreter "node"
  :config
  (setq
    js2-basic-offset tab-width
    js2-mode-show-parse-errors nil
    js2-mode-show-strict-warnings nil))

(use-package rjsx-mode
  :ensure t
  :mode "components\\/.*\\.js\\'"
  :config
  (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
  (flycheck-mode))

(use-package json-mode
  :ensure t
  :mode (("\\.tern-config\\'" . json-mode)
          ("\\.tern-project\\'" . json-mode)
          ("\\.babelrc\\'" . json-mode)
          ("\\.eslintrc\\'" . json-mode)
          ("\\.stylelintrc\\'" . json-mode))
  :config
  (setq
    json-mode-indent-level tab-width))
