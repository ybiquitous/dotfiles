(defun my/prettier ()
  (interactive)
  (let* ((prettier-command (format "%s --write %s"
                             (shell-quote-argument (executable-find "prettier"))
                             (shell-quote-argument (expand-file-name buffer-file-name)))))
    (message "Running %s..." prettier-command)
    (shell-command prettier-command)
    (revert-buffer t t t)
    (if (fboundp 'flycheck-buffer) (flycheck-buffer))))

(define-minor-mode my/prettier-mode
  "Minor mode for Prettier"
  :lighter " Prettier"
  (if my/prettier-mode
    (add-hook 'after-save-hook 'my/prettier t t)
    (remove-hook 'after-save-hook 'my/prettier t)))
