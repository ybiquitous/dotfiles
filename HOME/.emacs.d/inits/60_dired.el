(use-package dired
  :bind (
          :map dired-mode-map
          ("e" . wdired-change-to-wdired-mode))
  :init
  (require 'wdired)
  :config
  (setq wdired-allow-to-change-permissions t)
  )
