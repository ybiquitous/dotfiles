;; exec-path (https://github.com/jwiegley/use-package#conditional-loading)
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (dolist (var '("HISTFILE" "HISTSIZE" "EDITOR" "NODE_PATH"))
    (add-to-list 'exec-path-from-shell-variables var t ))
  (exec-path-from-shell-initialize))
