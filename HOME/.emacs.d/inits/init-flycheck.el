(require 'flycheck)

(custom-set-variables
 '(flycheck-temp-prefix ".flycheck")
 )

(add-hook 'after-init-hook #'global-flycheck-mode)

(defun my/add-node-modules-path ()
  (let* ((local-path (replace-regexp-in-string
                      "[\r\n]+$" "" (shell-command-to-string "npm bin"))))
    (setq-local exec-path (cons local-path exec-path))))

(add-hook 'flycheck-mode-hook 'my/add-node-modules-path)

(provide 'init-flycheck)
