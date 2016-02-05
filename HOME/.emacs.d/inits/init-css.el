(add-hook 'scss-mode-hook
          (lambda()
            (custom-set-variables
             '(scss-sass-command "node-sass")
             '(scss-compile-at-save nil))
            ))

(provide 'init-css)
