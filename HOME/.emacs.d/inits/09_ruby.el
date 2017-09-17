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
  (add-hook 'enh-ruby-mode-hook 'flyspell-prog-mode)
  (setq
   ruby-insert-encoding-magic-comment nil
   enh-ruby-indent-level tab-width
   enh-ruby-add-encoding-comment-on-save nil
   enh-ruby-deep-indent-paren nil
   enh-ruby-bounce-deep-indent t
   enh-ruby-hanging-indent-level tab-width))

(use-package robe
  :config
  (add-hook 'enh-ruby-mode-hook
    (lambda ()
      (robe-mode)
      (push 'company-robe company-backends))))

(use-package ruby-electric
  :config
  (add-hook 'enh-ruby-mode-hook 'ruby-electric-mode))
