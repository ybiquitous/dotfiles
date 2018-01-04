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
    enh-ruby-add-encoding-comment-on-save nil
    enh-ruby-deep-indent-paren nil
    enh-ruby-bounce-deep-indent t)
  (defun my/enh-ruby-mode-hook ()
    (robe-mode)
    (ruby-electric-mode)
    (flyspell-prog-mode)
    (setq-local flycheck-disabled-checkers '(ruby-reek))
    (if (locate-dominating-file default-directory "Gemfile")
      (progn
        (setq-local js-auto-format-command "bundle")
        (setq-local js-auto-format-command-args "exec rubocop --auto-correct --format emacs"))
      (progn
        (setq-local js-auto-format-command "rubocop")
        (setq-local js-auto-format-command-args "--auto-correct --format emacs")))
    (js-auto-format-mode))
  (add-hook 'enh-ruby-mode-hook #'my/enh-ruby-mode-hook))
