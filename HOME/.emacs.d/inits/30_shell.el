(add-hook 'shell-mode-hook
  (lambda ()
    (local-set-key (kbd "M-p") 'comint-previous-matching-input-from-input)
    (local-set-key (kbd "M-n") 'comint-next-matching-input-from-input)
    (setq comint-input-ring-file-name (getenv "HISTFILE"))
    (comint-read-input-ring)))

(add-hook 'eshell-mode-hook
    (lambda ()
      (setq eshell-history-file-name (getenv "HISTFILE"))))
