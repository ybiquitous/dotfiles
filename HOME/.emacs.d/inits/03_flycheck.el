(defun my-executable-find (command)
  (let* ((local-dir (string-trim (shell-command-to-string "npm bin")))
          (file-path (concat (file-name-as-directory local-dir) command)))
    (if (file-exists-p file-path) file-path (executable-find command))))

(use-package flycheck
  :init
  (setq
    flycheck-temp-prefix ".flycheck"
    flycheck-executable-find #'my-executable-find))

(add-hook 'after-init-hook #'global-flycheck-mode)
