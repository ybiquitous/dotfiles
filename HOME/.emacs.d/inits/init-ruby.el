(require 'company-robe)

(add-hook 'ruby-mode-hook
          (lambda ()
            (custom-set-variables
             '(ruby-insert-encoding-magic-comment nil))
            (robe-mode t)
            (add-to-list 'company-backends 'company-robe)
            ))

(provide 'init-ruby)
