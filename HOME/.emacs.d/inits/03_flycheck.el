(defun my/find-npm-command (command)
  (let* ((dirname "node_modules")
          (root (locate-dominating-file default-directory dirname)))
    (if root (concat
               (file-name-as-directory root)
               (file-name-as-directory dirname)
               (file-name-as-directory ".bin")
               command))))

(defun my/executable-find (command)
  (let* ((file-path (my/find-npm-command command)))
    (if (and file-path (file-executable-p file-path))
      file-path (executable-find command))))

(use-package flycheck
  :init (global-flycheck-mode)
  :config
  (setq
    flycheck-temp-prefix ".flycheck"
    flycheck-executable-find #'my/executable-find))
