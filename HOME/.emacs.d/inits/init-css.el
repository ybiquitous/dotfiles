(require 'flycheck)

(flycheck-def-config-file-var flycheck-sass-lintrc sass-lint ".sass-lint.yml"
  :safe #'stringp)

(flycheck-define-checker sass-lint
  "A SASS (SCSS) checker using Sass Lint (on Node.js).

See URL `https://github.com/sasstools/sass-lint'."
  :command ("sass-lint"
            "--verbose"
            "--format" "checkstyle"
            (config-file "--config" flycheck-sass-lintrc)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (sass-mode scss-mode))

(add-hook 'scss-mode-hook
          (lambda()
            (custom-set-variables
             '(scss-sass-command "node-sass")
             '(scss-compile-at-save nil)
             '(flycheck-disabled-checkers (flycheck-scss-lint)))
            (add-to-list 'flycheck-checkers 'sass-lint)
            ))

(provide 'init-css)
