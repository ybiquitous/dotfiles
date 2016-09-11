(require 'flycheck)

;;; stylelint (https://github.com/flycheck/flycheck/issues/785)
(flycheck-define-checker stylelint-lint
  "A SCSS checker using stylelint.

See URL `http://stylelint.io/'."
  :command ("stylelint" source)
  :error-patterns
  ((error line-start
          (zero-or-more (any space)) line ":" column
          (one-or-more (any space)) "✖" (one-or-more (any space))
          (message)
          (zero-or-more (any space))
          line-end))
  :modes (css-mode scss-mode))
;;; stylelint

(add-to-list 'flycheck-checkers 'stylelint-lint)

(add-hook 'scss-mode-hook
          (lambda()
            (custom-set-variables
             '(scss-sass-command "node-sass")
             '(scss-compile-at-save nil))
            ))

(provide 'init-css)
