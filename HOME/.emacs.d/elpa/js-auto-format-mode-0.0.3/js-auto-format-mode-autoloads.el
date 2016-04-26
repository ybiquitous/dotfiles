;;; js-auto-format-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "js-auto-format-mode" "js-auto-format-mode.el"
;;;;;;  (22302 51725 595529 410000))
;;; Generated autoloads from js-auto-format-mode.el

(defvar js-auto-format-command "eslint" "\
JavaScript auto format command.")

(custom-autoload 'js-auto-format-command "js-auto-format-mode" t)

(defvar js-auto-format-command-args "--fix" "\
JavaScript auto format command arguments.")

(custom-autoload 'js-auto-format-command-args "js-auto-format-mode" t)

(autoload 'js-auto-format-execute "js-auto-format-mode" "\
Format JavaScript source code.

\(fn)" nil nil)

(autoload 'js-auto-format-mode "js-auto-format-mode" "\
Minor mode for auto-formatting JavaScript code

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("js-auto-format-mode-pkg.el") (22302 51725
;;;;;;  607090 580000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; js-auto-format-mode-autoloads.el ends here
