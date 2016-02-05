(defun _posix-path (filename)
  (format _posix-path-format filename))

;; Flycheck
(add-hook 'after-init-hook
          (lambda()
            (if (eq system-type 'windows-nt)
                (progn
                  ;; rgrep を有効にする
                  (setq find-program (_posix-path "find.exe")
                        grep-program (_posix-path "grep.exe")
                        diff-command (_posix-path "diff.exe")
                        null-device "/dev/null")

                  ;; Flycheck
                  (custom-set-variables
                   '(flycheck-sh-bash-executable (_posix-path "bash.exe"))
                   '(flycheck-sh-posix-bash-executable (_posix-path "bash.exe")))
                  ))))

(provide 'init-windows)
;;; init-windows.el ends here
