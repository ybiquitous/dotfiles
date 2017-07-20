;; https://github.com/jwiegley/use-package#conditional-loading
(use-package edit-server
  :if window-system
  :init
  (add-hook 'after-init-hook 'server-start t))
