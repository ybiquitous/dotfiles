;;; flymake-scala.el --- Flymake Scala Mode
;;
;; Copyright (C) 2013 ybiquitous
;;
;; Author: ybiquitous <10koba01 [at] gmail.com>
;; URL: https://github.com/
;; Version: DEV
;; Package-Requires: ((flymake-easy "0.1"))
;; Keywords: flymake scala
;;
;;; Commentary:
;;
;;; Usage:
;;
;; (require 'flymake-scala)
;; (add-hook 'scala-mode-hook 'flymake-scala-load)
;;
;;; Code:

(require 'flymake-easy)

(defconst flymake-scala-err-line-patterns
  '(("^\\(.+\\):\\([0-9]+\\): \\(.+\\)$" 1 2 nil 3)))

(defcustom flymake-scala-compiler "scalac"
  "Scala Compiler"
  :group 'flymake-scala
  :type 'string)

(defcustom flymake-scala-compile-options "-deprecation -unchecked"
  "Scala Compile Options"
  :group 'flymake-scala
  :type 'string)

(defun flymake-scala-command (filename)
  "Construct a command which can compile scala source."
  (append
   (list flymake-scala-compiler)
   (split-string flymake-scala-compile-options " ")
   (list filename)))

;;;###autoload
(defun flymake-scala-load ()
  "Configure flymake mode to check scala syntax."
  (interactive)
  (flymake-easy-load 'flymake-scala-command
                     flymake-scala-err-line-patterns
                     'tempdir
                     "scala"))

(provide 'flymake-scala)
;;; flymake-scala.el ends here
