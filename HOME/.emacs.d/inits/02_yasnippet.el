(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (yas-global-mode t))

;; instead of original 'yasnippet/snippets'
(use-package yasnippet-snippets
  :config
  (yasnippet-snippets-initialize))
