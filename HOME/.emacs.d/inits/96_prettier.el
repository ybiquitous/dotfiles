(defun my/prettier ()
  (interactive)
  (shell-command
    (format "%s --write %s"
      (shell-quote-argument (executable-find "prettier"))
      (shell-quote-argument (expand-file-name buffer-file-name))))
  (revert-buffer t t t)
  (if (fboundp 'flycheck-buffer) (flycheck-buffer)))

(add-hook 'markdown-mode-hook
  (lambda ()
    (add-hook 'after-save-hook 'my/prettier t t)))
