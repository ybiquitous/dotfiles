(defcustom java-compile-enabled t
  "*Turn on/off Java compile"
  :type 'boolean
  :group 'java)

(defcustom java-compile-option "-Xlint"
  "*Java compile option"
  :type 'string
  :group 'java)

(defun java-compile ()
  (if java-compile-enabled
      (progn
        (shell-command (format "javac %s %s" java-compile-option buffer-file-name) "*Java*")
        (dolist (file (directory-files default-directory t (concat (file-name-base buffer-file-name) ".*.class"))) (delete-file file))
        )))

(add-hook 'java-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'java-compile t t)
            ))
