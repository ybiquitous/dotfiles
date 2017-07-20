(use-package shell
  :bind (:map shell-mode-map
          ("M-p" . comint-previous-matching-input-from-input)
          ("M-n" . comint-next-matching-input-from-input))
  :config
  (setq comint-input-ring-file-name (getenv "HISTFILE"))
  (comint-read-input-ring))

(use-package eshell
  :config
  (setq eshell-history-file-name (getenv "HISTFILE")))
