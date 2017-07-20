(use-package web-mode
  :mode (("\\.jsp\\'" . web-mode)
         ("\\.html\\'" . web-mode)
          ("\\.erb\\'" . web-mode))
  :config
  (setq web-mode-code-indent-offset tab-width)
  (setq web-mode-css-indent-offset tab-width)
  (setq web-mode-markup-indent-offset tab-width)
  (setq web-mode-script-padding tab-width)
  (setq web-mode-sql-indent-offset tab-width)
  (setq web-mode-style-padding tab-width))
