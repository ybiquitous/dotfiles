(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode t))

;; intead of original 'yasnippet/snippets'
(use-package yasnippet-snippets)
