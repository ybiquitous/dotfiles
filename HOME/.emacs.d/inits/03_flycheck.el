(defun my-executable-find (command)
  (let* ((local-dir (string-trim (shell-command-to-string "npm bin")))
          (file-path (concat (file-name-as-directory local-dir) command)))
    (if (file-exists-p file-path) file-path (executable-find command))))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (setq
    flycheck-temp-prefix ".flycheck"
    flycheck-executable-find #'my-executable-find))
