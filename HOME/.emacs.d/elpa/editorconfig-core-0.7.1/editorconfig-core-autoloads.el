;;; editorconfig-core-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (editorconfig-core-get-properties-hash editorconfig-core-get-properties)
;;;;;;  "editorconfig-core" "editorconfig-core.el" (22181 31117 386396
;;;;;;  693000))
;;; Generated autoloads from editorconfig-core.el

(autoload 'editorconfig-core-get-properties "editorconfig-core" "\
Get EditorConfig properties for FILE.
If FILE is not given, use currently visiting file.
Give CONFNAME for basename of config file other than .editorconfig.
If need to specify config format version, give CONFVERSION.

This functions returns alist of properties.  Each element will look like
'(KEY . VALUE) .

\(fn &optional FILE CONFNAME CONFVERSION)" nil nil)

(autoload 'editorconfig-core-get-properties-hash "editorconfig-core" "\
Get EditorConfig properties for FILE.
If FILE is not given, use currently visiting file.
Give CONFNAME for basename of config file other than .editorconfig.
If need to specify config format version, give CONFVERSION.

This function is almost same as `editorconfig-core-get-properties', but returns
hash object instead.

\(fn &optional FILE CONFNAME CONFVERSION)" nil nil)

;;;***

;;;### (autoloads nil nil ("editorconfig-core-handle.el" "editorconfig-core-pkg.el")
;;;;;;  (22181 31117 419859 357000))

;;;***

(provide 'editorconfig-core-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; editorconfig-core-autoloads.el ends here
