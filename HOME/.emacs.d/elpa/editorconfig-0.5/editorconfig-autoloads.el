;;; editorconfig-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (editorconfig-mode editorconfig-find-file-hook)
;;;;;;  "editorconfig" "editorconfig.el" (22110 22169 125617 894000))
;;; Generated autoloads from editorconfig.el

(autoload 'editorconfig-find-file-hook "editorconfig" "\


\(fn)" nil nil)

(defvar editorconfig-mode nil "\
Non-nil if Editorconfig mode is enabled.
See the command `editorconfig-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `editorconfig-mode'.")

(custom-autoload 'editorconfig-mode "editorconfig" nil)

(autoload 'editorconfig-mode "editorconfig" "\
Toggle EditorConfig feature.

\(fn &optional ARG)" t nil)

(add-to-list 'auto-mode-alist '("/\\.editorconfig\\'" . conf-unix-mode))

;;;***

;;;### (autoloads nil nil ("editorconfig-pkg.el") (22110 22169 318421
;;;;;;  61000))

;;;***

(provide 'editorconfig-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; editorconfig-autoloads.el ends here
