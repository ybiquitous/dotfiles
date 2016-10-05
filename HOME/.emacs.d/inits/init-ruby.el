(require 'company-robe)
(require 'flycheck)

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

;; To have reek to smell-check the ruby files
;; https://gist.github.com/franciscoj/cf308995aaabf99e33a2
(flycheck-define-checker ruby-reek
  "A Ruby smeel checker using reek
See URL `https://github.com/troessner/reek'."
  :command ("reek" "--format=xml" source-original)
  :standard-input t
  :error-parser flycheck-parse-checkstyle
  :modes (enh-ruby-mode ruby-mode)
  :next-checkers (ruby-rubocop))
(add-to-list 'flycheck-checkers 'ruby-reek)

(provide 'init-ruby)
