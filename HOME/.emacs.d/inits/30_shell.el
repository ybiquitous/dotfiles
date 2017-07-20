;; exec-path (https://github.com/jwiegley/use-package#conditional-loading)
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :init
  (exec-path-from-shell-copy-envs '("HISTFILE" "HISTSIZE"))
  :config
  (exec-path-from-shell-initialize))

(use-package shell
  :bind (:map shell-mode-map
          ("M-p" . comint-previous-matching-input-from-input)
          ("M-n" . comint-next-matching-input-from-input))
  :config
  (setq comint-input-ring-file-name (getenv "HISTFILE")))
  (comint-read-input-ring t))

(use-package eshell
  :config
  (setq eshell-history-file-name (getenv "HISTFILE")))
