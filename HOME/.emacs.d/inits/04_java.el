(defcustom java-compile-enabled t
  "*Turn on/off Java compile"
  :type 'boolean
  :group 'java)

(defcustom java-compile-option "-Xlint"
  "*Java compile option"
  :type 'string
  :group 'java)

(defun my/java-compile ()
  (when java-compile-enabled
    (shell-command (format "javac %s %s" java-compile-option buffer-file-name) "*Java*")
    (dolist (file (directory-files default-directory t (concat (file-name-base buffer-file-name) ".*.class"))) (delete-file file))))

(defun my/java-mode-hook ()
  (add-hook 'after-save-hook #'my/java-compile t t))

(add-hook 'java-mode-hook #'my/java-mode-hook)
