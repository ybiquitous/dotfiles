(defun java-compile ()
  (shell-command (format "javac %s" buffer-file-name)))
(add-hook 'java-mode-hook
          (lambda () (add-hook 'after-save-hook 'java-compile)))

(provide 'init-java)
;;; init-java.el ends here
