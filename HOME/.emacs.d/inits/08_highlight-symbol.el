(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode) ;; move by M-p and M-n

(use-package highlight-symbol
  :bind (:map highlight-symbol-mode
          ("C-c r" . highlight-symbol-query-replace)))
