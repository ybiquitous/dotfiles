(add-hook 'sh-mode-hook
  (lambda ()
    (setq
      sh-basic-offset tab-width
      sh-indentation tab-width)))
