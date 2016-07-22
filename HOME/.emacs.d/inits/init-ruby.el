(require 'company-robe)

(add-hook 'ruby-mode-hook
          (lambda ()
            (custom-set-variables
             '(ruby-insert-encoding-magic-comment nil))
            (robe-mode t)
            (add-to-list 'company-backends 'company-robe)
            ))

(defun rails-jump-to-test ()
  "Rails Jump to Test"
  (interactive)
  (let* ((test-file-name (replace-regexp-in-string ".rb" "_test.rb" buffer-file-name))
         (test-file-name (replace-regexp-in-string "/app/" "/test/" test-file-name)))
    (unless (file-exists-p test-file-name)
      (progn (setq test-file-name (replace-regexp-in-string "_test.rb" "_spec.rb" test-file-name)))
      (progn (setq test-file-name (replace-regexp-in-string "/test/" "/spec/" test-file-name)))
      )
    (if (file-exists-p test-file-name)
        (find-file test-file-name)
      (message "No test file: %s" test-file-name))))

(provide 'init-ruby)
