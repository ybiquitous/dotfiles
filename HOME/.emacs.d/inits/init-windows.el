;; Usage:
;;     (defconst _posix-path-format "\"C:\\Program Files\\Git\\usr\\bin\\%s\"")
(defun _posix-path (filename)
  (format _posix-path-format filename))

(add-hook 'after-init-hook
          (lambda()
            ;; Enable `rgrep'
            (setq find-program (_posix-path "find.exe")
                  grep-program (_posix-path "grep.exe")
                  diff-command (_posix-path "diff.exe")
                  null-device "/dev/null")
            ))

(provide 'init-windows)
;;; init-windows.el ends here
