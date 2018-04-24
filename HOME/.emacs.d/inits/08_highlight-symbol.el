(defun my/enable-highlight-symbol-mode ()
  (highlight-symbol-mode)
  (highlight-symbol-nav-mode)) ;; move by M-p and M-n

(use-package highlight-symbol
  :delight
  :bind ("C-c r" . highlight-symbol-query-replace)
  :config
  (add-hook 'prog-mode-hook #'my/enable-highlight-symbol-mode))
