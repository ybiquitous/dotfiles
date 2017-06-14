;;; js-auto-format-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "js-auto-format-mode" "js-auto-format-mode.el"
;;;;;;  (22849 26643 348327 444000))
;;; Generated autoloads from js-auto-format-mode.el

(defvar js-auto-format-command "eslint" "\
JavaScript auto format command.")

(custom-autoload 'js-auto-format-command "js-auto-format-mode" t)

(defvar js-auto-format-command-args "--fix" "\
JavaScript auto format command arguments.")

(custom-autoload 'js-auto-format-command-args "js-auto-format-mode" t)

(defvar js-auto-format-disabled nil "\
JavaScript auto format disabled.")

(custom-autoload 'js-auto-format-disabled "js-auto-format-mode" t)

(autoload 'js-auto-format-execute "js-auto-format-mode" "\
Format JavaScript source code.

\(fn)" t nil)

(autoload 'js-auto-format-mode "js-auto-format-mode" "\
Minor mode for auto-formatting JavaScript code

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; js-auto-format-mode-autoloads.el ends here
