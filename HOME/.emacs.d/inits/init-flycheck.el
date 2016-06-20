(require 'flycheck)

(custom-set-variables
 '(flycheck-temp-prefix ".flycheck")
 )

(add-hook 'after-init-hook #'global-flycheck-mode)

(defun my/add-node-modules-path ()
  (let* ((root (locate-dominating-file default-directory "node_modules"))
         (local-path (expand-file-name "node_modules/.bin" root)))
    (when (file-directory-p local-path)
      (setq-local exec-path (cons local-path exec-path))
      )))

(add-hook 'flycheck-mode-hook 'my/add-node-modules-path)

(provide 'init-flycheck)
