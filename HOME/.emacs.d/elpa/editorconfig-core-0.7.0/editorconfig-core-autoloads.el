;;; editorconfig-core-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "editorconfig-core" "../../../../../.emacs.d/elpa/editorconfig-core-0.7.0/editorconfig-core.el"
;;;;;;  "e0eb9813de214df97dd727e85c2a2e0a")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/editorconfig-core-0.7.0/editorconfig-core.el

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

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/editorconfig-core-0.7.0/editorconfig-core-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-core-0.7.0/editorconfig-core-handle.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-core-0.7.0/editorconfig-core-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-core-0.7.0/editorconfig-core.el")
;;;;;;  (22172 37107 561313 600000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; editorconfig-core-autoloads.el ends here
