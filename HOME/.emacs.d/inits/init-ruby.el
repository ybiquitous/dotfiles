(add-hook 'ruby-mode-hook
          (lambda ()
            (custom-set-variables
             '(ruby-insert-encoding-magic-comment nil))
            ))

(provide 'init-ruby)
