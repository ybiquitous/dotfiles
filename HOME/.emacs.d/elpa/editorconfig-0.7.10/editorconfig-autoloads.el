;;; editorconfig-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "editorconfig" "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig.el"
;;;;;;  "354ba3a0b6b41f150537632d4e918c88")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig.el

(autoload 'editorconfig-find-current-editorconfig "editorconfig" "\
Find the closest .editorconfig file for current file.

\(fn)" t nil)

(autoload 'editorconfig-display-current-properties "editorconfig" "\
Display EditorConfig properties extracted for current buffer.

\(fn)" t nil)

(autoload 'editorconfig-apply "editorconfig" "\
Apply EditorConfig properties for current buffer.
This function ignores `editorconfig-exclude-modes' and always
applies available properties.

\(fn)" t nil)

(defvar editorconfig-mode nil "\
Non-nil if Editorconfig mode is enabled.
See the `editorconfig-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `editorconfig-mode'.")

(custom-autoload 'editorconfig-mode "editorconfig" nil)

(autoload 'editorconfig-mode "editorconfig" "\
Toggle EditorConfig feature.
When enabled EditorConfig properties will be applied to buffers
when first visiting files or changing major modes if the major
mode is not listed in `editorconfig-exclude-modes'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "editorconfig-conf-mode" "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-conf-mode.el"
;;;;;;  "d8f231bb7239f4031816161b7ea59209")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-conf-mode.el

(autoload 'editorconfig-conf-mode "editorconfig-conf-mode" "\
Major mode for editing .editorconfig files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("/\\.editorconfig\\'" . editorconfig-conf-mode))

;;;***

;;;### (autoloads nil "editorconfig-core" "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-core.el"
;;;;;;  "16ebcf900bd8e3b93b6881bb09f8c1f8")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-core.el

(autoload 'editorconfig-core-get-nearest-editorconfig "editorconfig-core" "\
Return path to .editorconfig file that is closest to DIRECTORY.

\(fn DIRECTORY)" nil nil)

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

;;;### (autoloads nil "editorconfig-fnmatch" "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-fnmatch.el"
;;;;;;  "c03ca189a6b3bee27f40b8a0e6b093a0")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-fnmatch.el

(autoload 'editorconfig-fnmatch-p "editorconfig-fnmatch" "\
Test whether NAME match PATTERN.

Matching ignores case if `case-fold-search' is non-nil.

PATTERN should be a shell glob pattern, and some zsh-like wildcard matchings can
be used:

*           Matches any string of characters, except path separators (/)
**          Matches any string of characters
?           Matches any single character
\[name]      Matches any single character in name
\[^name]     Matches any single character not in name
{s1,s2,s3}  Matches any of the strings given (separated by commas)
{min..max}  Matches any number between min and max

\(fn NAME PATTERN)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-conf-mode.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-core-handle.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-core.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-fnmatch.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-0.7.10/editorconfig.el")
;;;;;;  (22895 64747 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; editorconfig-autoloads.el ends here
