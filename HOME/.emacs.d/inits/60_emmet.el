(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)
(add-hook 'rjsx-mode-hook 'emmet-mode)

(use-package emmet
  :config
  (setq emmet-indentation tab-width))
