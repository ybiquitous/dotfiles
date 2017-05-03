(require 'flycheck)

(custom-set-variables
 '(flycheck-temp-prefix ".flycheck")
 '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs javascript-gjslint javascript-standard))
 )

(add-hook 'after-init-hook #'global-flycheck-mode)

(defun my/use-node-modules-bin ()
  (let* ((local-path (replace-regexp-in-string
                      "[\r\n]+$" "" (shell-command-to-string "npm bin"))))
    (setq-local exec-path (cons local-path exec-path))))

(add-hook 'flycheck-mode-hook #'my/use-node-modules-bin)

(provide 'init-flycheck)
