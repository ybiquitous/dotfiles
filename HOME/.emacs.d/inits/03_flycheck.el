(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq
    flycheck-temp-prefix ".flycheck"))
