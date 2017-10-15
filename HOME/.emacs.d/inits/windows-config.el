;; Usage:
;;     (defconst _posix-path-format "\"C:\\Program Files\\Git\\usr\\bin\\%s\"")
(defun _posix-path (filename)
  (format _posix-path-format filename))

;; Enable `rgrep'
(setq
  find-program (_posix-path "find.exe")
  grep-program (_posix-path "grep.exe")
  diff-command (_posix-path "diff.exe")
  null-device "/dev/null"
  shell-file-name "/bin/sh")))
