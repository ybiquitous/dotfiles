(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode t))

;; intead of original 'yasnippet/snippets'
(use-package yasnippet-snippets
  :config
  (yasnippet-snippets-initialize))
