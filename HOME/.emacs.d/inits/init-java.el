(defun java-compile ()
  (shell-command (format "javac -Xlint %s" buffer-file-name)))
(add-hook 'java-mode-hook
          (lambda () (add-hook 'after-save-hook 'java-compile nil 'make-it-local)))

(provide 'init-java)
;;; init-java.el ends here
