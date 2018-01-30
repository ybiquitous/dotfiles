(use-package highlight-symbol
  :delight
  :bind ("C-c r" . highlight-symbol-query-replace)
  :config
  (add-hook 'prog-mode-hook #'highlight-symbol-mode)
  (add-hook 'prog-mode-hook #'highlight-symbol-nav-mode)) ;; move by M-p and M-n
