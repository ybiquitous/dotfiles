(use-package whitespace
  :diminish global-whitespace-mode
  :config
  (setq
    whitespace-action '(auto-cleanup)
    whitespace-display-mappings '((space-mark ?\u3000 [?\u25a1])
                                   (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t]))
    whitespace-space-regexp "\\(\\u3000+\\)"
    whitespace-line-column 100
    whitespace-style '(face tabs spaces trailing lines-tail space-mark tab-mark))
  (global-whitespace-mode t))
