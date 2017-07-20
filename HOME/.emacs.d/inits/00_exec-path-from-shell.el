;; exec-path (https://github.com/jwiegley/use-package#conditional-loading)
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (add-to-list 'exec-path-from-shell-variables "HISTFILE")
  (add-to-list 'exec-path-from-shell-variables "HISTSIZE")
  (exec-path-from-shell-initialize))
