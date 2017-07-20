;;; stylelint (https://github.com/flycheck/flycheck/issues/785)
(flycheck-define-checker stylelint-lint
  "A SCSS checker using stylelint.

See URL `http://stylelint.io/'."
  :command ("stylelint" source-original)
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

(use-package scss-mode
  :ensure t
  :config
  (setq
    scss-sass-command "node-sass"
    scss-compile-at-save nil))
