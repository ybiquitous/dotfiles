(use-package web-mode
  :mode (("\\.jsp\\'"  . web-mode)
         ("\\.html\\'" . web-mode)
         ("\\.erb\\'"  . web-mode))
  :custom
  (web-mode-sql-indent-offset tab-width)
  (web-mode-script-padding tab-width)
  (web-mode-style-padding tab-width)
  (web-mode-block-padding tab-width))
