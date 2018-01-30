(use-package whitespace
  :delight global-whitespace-mode
  :custom
  (whitespace-action '(auto-cleanup))
  (whitespace-display-mappings '((space-mark ?\u3000 [?\u25a1])
                                 (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
  (whitespace-space-regexp "\\(\\u3000+\\)")
  (whitespace-line-column 120)
  (whitespace-style '(face tabs spaces trailing lines-tail space-mark tab-mark))
  :config
  (global-whitespace-mode))
