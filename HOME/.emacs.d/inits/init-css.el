(require 'flycheck)

;;; stylelint (https://github.com/flycheck/flycheck/issues/785)
(flycheck-define-checker stylelint-scss-lint
  "A SCSS checker using stylelint.

See URL `http://stylelint.io/'."
  :command ("stylelint" "--syntax" "scss" source)
  :error-patterns
  ((error line-start
          (zero-or-more (any space)) line ":" column
          (one-or-more (any space)) "✖" (one-or-more (any space))
          (message)
          (zero-or-more (any space))
          line-end))
  :modes (scss-mode))
;;; stylelint

(add-hook 'scss-mode-hook
          (lambda()
            (custom-set-variables
             '(scss-sass-command "node-sass")
             '(scss-compile-at-save nil))
            (add-to-list 'flycheck-checkers 'stylelint-scss-lint)
            (flycheck-disable-checker 'scss-lint)
            ))

(provide 'init-css)
