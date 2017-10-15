(defun my/js-mode-hook ()
  (setq-local js-indent-level tab-width)
  (setq-local js-switch-indent-offset tab-width))
(add-hook 'js-mode-hook #'my/js-mode-hook)

(use-package js2-mode
  :bind (:map js2-mode-map
          ("C-c i" . js-doc-insert-function-doc))
  :mode "\\.js\\'"
  :interpreter "node"
  :config
  (add-hook 'js2-mode-hook #'flyspell-prog-mode)
  (setq
    js2-basic-offset tab-width
    js2-mode-show-parse-errors nil
    js2-mode-show-strict-warnings nil))

(use-package js-auto-format-mode
  :config
  (add-hook 'js-mode-hook #'js-auto-format-mode)
  (add-hook 'js2-mode-hook #'js-auto-format-mode))

(use-package add-node-modules-path
  :config
  (add-hook 'js-mode-hook #'add-node-modules-path)
  (add-hook 'js2-mode-hook #'add-node-modules-path))

(use-package tern
  :config
  (add-hook 'js2-mode-hook #'tern-mode))

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
