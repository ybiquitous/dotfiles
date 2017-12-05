(use-package js2-mode
  :mode "\\.m?js\\'"
  :interpreter "node"
  :config
  (add-hook 'js2-mode-hook #'flyspell-prog-mode)
  (setq
    js2-mode-show-parse-errors nil
    js2-mode-show-strict-warnings nil))

(use-package js-auto-format-mode
  :config
  (setq js-auto-format-command-args (concat js-auto-format-command-args " --no-ignore"))
  (add-hook 'js-mode-hook #'js-auto-format-mode))

(use-package add-node-modules-path
  :config
  (add-hook 'js-mode-hook #'add-node-modules-path)
  (add-hook 'css-mode-hook #'add-node-modules-path))

(use-package tern
  :config
  (add-hook 'js-mode-hook #'tern-mode))

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
  (defun my/json-mode-hook ()
    (setq-local js-auto-format-disabled t))
  (add-hook 'json-mode-hook #'my/json-mode-hook))
