(use-package highlight-symbol
  :ensure t
  :bind (:map highlight-symbol-mode
          ("C-c r" . highlight-symbol-query-replace))
  :init
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)) ;; move by M-p and M-n
