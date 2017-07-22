(use-package enh-ruby-mode
  :interpreter "ruby"
  :mode (("\\.rb\\'"       . enh-ruby-mode)
         ("\\.ru\\'"       . enh-ruby-mode)
         ("\\.jbuilder\\'" . enh-ruby-mode)
         ("\\.gemspec\\'"  . enh-ruby-mode)
         ("\\.rake\\'"     . enh-ruby-mode)
         ("Rakefile\\'"    . enh-ruby-mode)
         ("Gemfile\\'"     . enh-ruby-mode)
         ("Guardfile\\'"   . enh-ruby-mode)
         ("Capfile\\'"     . enh-ruby-mode)
         ("Vagrantfile\\'" . enh-ruby-mode))
  :config
  (setq
   ruby-insert-encoding-magic-comment nil
   enh-ruby-indent-level tab-width
   enh-ruby-add-encoding-comment-on-save nil
   enh-ruby-deep-indent-paren nil
   enh-ruby-bounce-deep-indent t
   enh-ruby-hanging-indent-level tab-width))

(use-package robe
  :init
  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  :config
  (add-to-list 'company-backends 'company-robe))

(use-package rbenv)

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
