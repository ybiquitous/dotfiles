(use-package flycheck
  :config
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(scss-lint))
  (setq
    flycheck-temp-prefix ".flycheck"))

(use-package package-lint)
(use-package flycheck-package
  :config
  (flycheck-package-setup))
