(defun my/sh-mode-hook ()
  (setq-local sh-basic-offset tab-width)
  (setq-local sh-indentation tab-width))
(add-hook 'sh-mode-hook #'my/sh-mode-hook)
