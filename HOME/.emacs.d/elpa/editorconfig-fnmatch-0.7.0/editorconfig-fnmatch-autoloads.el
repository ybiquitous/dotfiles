;;; editorconfig-fnmatch-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "editorconfig-fnmatch" "../../../../../.emacs.d/elpa/editorconfig-fnmatch-0.7.0/editorconfig-fnmatch.el"
;;;;;;  "bfe917da974f3627935343539b870d1b")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/editorconfig-fnmatch-0.7.0/editorconfig-fnmatch.el

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

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/editorconfig-fnmatch-0.7.0/editorconfig-fnmatch-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-fnmatch-0.7.0/editorconfig-fnmatch.el")
;;;;;;  (22172 37106 155020 300000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; editorconfig-fnmatch-autoloads.el ends here
