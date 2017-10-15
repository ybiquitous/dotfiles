(use-package robe
  :config
  (eval-after-load 'company
    '(push 'company-robe company-backends)))

(use-package ruby-electric)

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
    enh-ruby-bounce-deep-indent t)
  (defun my/enh-ruby-mode-hook ()
    (robe-mode)
    (ruby-electric-mode)
    (flyspell-prog-mode)
    (setq-local enh-ruby-hanging-indent-level tab-width))
  (add-hook 'enh-ruby-mode-hook #'my/enh-ruby-mode-hook))
