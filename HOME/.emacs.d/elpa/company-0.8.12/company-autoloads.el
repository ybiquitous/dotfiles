;;; company-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "company" "../../../../../.emacs.d/elpa/company-0.8.12/company.el"
;;;;;;  "e93c49b6c712038d892a4b9503441d34")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company.el

(autoload 'company-mode "company" "\
\"complete anything\"; is an in-buffer completion framework.
Completion starts automatically, depending on the values
`company-idle-delay' and `company-minimum-prefix-length'.

Completion can be controlled with the commands:
`company-complete-common', `company-complete-selection', `company-complete',
`company-select-next', `company-select-previous'.  If these commands are
called before `company-idle-delay', completion will also start.

Completions can be searched with `company-search-candidates' or
`company-filter-candidates'.  These can be used while completion is
inactive, as well.

The completion data is retrieved using `company-backends' and displayed
using `company-frontends'.  If you want to start a specific back-end, call
it interactively or use `company-begin-backend'.

regular keymap (`company-mode-map'):

\\{company-mode-map}
keymap during active completions (`company-active-map'):

\\{company-active-map}

\(fn &optional ARG)" t nil)

(defvar global-company-mode nil "\
Non-nil if Global-Company mode is enabled.
See the command `global-company-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-company-mode'.")

(custom-autoload 'global-company-mode "company" nil)

(autoload 'global-company-mode "company" "\
Toggle Company mode in all buffers.
With prefix ARG, enable Global-Company mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Company mode is enabled in all buffers where
`company-mode-on' would do it.
See `company-mode' for more information on Company mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "company-abbrev" "../../../../../.emacs.d/elpa/company-0.8.12/company-abbrev.el"
;;;;;;  "64209a8554385edf4cc4d47fb605a27e")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-abbrev.el

(autoload 'company-abbrev "company-abbrev" "\
`company-mode' completion back-end for abbrev.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-bbdb" "../../../../../.emacs.d/elpa/company-0.8.12/company-bbdb.el"
;;;;;;  "f99888b2029754487735f2fd035d0f77")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-bbdb.el

(autoload 'company-bbdb "company-bbdb" "\
`company-mode' completion back-end for BBDB.

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads nil "company-css" "../../../../../.emacs.d/elpa/company-0.8.12/company-css.el"
;;;;;;  "ea493e9e2010195f0d6cf2770bbf13de")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-css.el

(autoload 'company-css "company-css" "\
`company-mode' completion back-end for `css-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-dabbrev" "../../../../../.emacs.d/elpa/company-0.8.12/company-dabbrev.el"
;;;;;;  "ca6a72e0fa38e7cb3d66913a15e39da3")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-dabbrev.el

(autoload 'company-dabbrev "company-dabbrev" "\
dabbrev-like `company-mode' completion back-end.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-dabbrev-code" "../../../../../.emacs.d/elpa/company-0.8.12/company-dabbrev-code.el"
;;;;;;  "d8dc1ca9060d531098d2481b81f978fb")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-dabbrev-code.el

(autoload 'company-dabbrev-code "company-dabbrev-code" "\
dabbrev-like `company-mode' back-end for code.
The back-end looks for all symbols in the current buffer that aren't in
comments or strings.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-elisp" "../../../../../.emacs.d/elpa/company-0.8.12/company-elisp.el"
;;;;;;  "7f318e920c6c8a236549922c3f63efc2")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-elisp.el

(autoload 'company-elisp "company-elisp" "\
`company-mode' completion back-end for Emacs Lisp.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-etags" "../../../../../.emacs.d/elpa/company-0.8.12/company-etags.el"
;;;;;;  "554ba563f008f628ee272eed0be5f13f")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-etags.el

(autoload 'company-etags "company-etags" "\
`company-mode' completion back-end for etags.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-files" "../../../../../.emacs.d/elpa/company-0.8.12/company-files.el"
;;;;;;  "d62a50eec4ad9fd6fe6a6bac7b4adddd")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-files.el

(autoload 'company-files "company-files" "\
`company-mode' completion back-end existing file names.
Completions works for proper absolute and relative files paths.
File paths with spaces are only supported inside strings.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-gtags" "../../../../../.emacs.d/elpa/company-0.8.12/company-gtags.el"
;;;;;;  "37e7074485e3b0e5e8b6b4b7b3fa675a")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-gtags.el

(autoload 'company-gtags "company-gtags" "\
`company-mode' completion back-end for GNU Global.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-ispell" "../../../../../.emacs.d/elpa/company-0.8.12/company-ispell.el"
;;;;;;  "b8b77824d5d483a2ee30ddff18734cd1")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-ispell.el

(autoload 'company-ispell "company-ispell" "\
`company-mode' completion back-end using Ispell.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-keywords" "../../../../../.emacs.d/elpa/company-0.8.12/company-keywords.el"
;;;;;;  "f2c90d085fe709a7c46170239da28eac")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-keywords.el

(autoload 'company-keywords "company-keywords" "\
`company-mode' back-end for programming language keywords.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-nxml" "../../../../../.emacs.d/elpa/company-0.8.12/company-nxml.el"
;;;;;;  "436b717c26d833060b025f4c4a59b2e6")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-nxml.el

(autoload 'company-nxml "company-nxml" "\
`company-mode' completion back-end for `nxml-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-oddmuse" "../../../../../.emacs.d/elpa/company-0.8.12/company-oddmuse.el"
;;;;;;  "51482624a3efcf2bd1881770d99cee2b")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-oddmuse.el

(autoload 'company-oddmuse "company-oddmuse" "\
`company-mode' completion back-end for `oddmuse-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-pysmell" "../../../../../.emacs.d/elpa/company-0.8.12/company-pysmell.el"
;;;;;;  "409d3f51f8c28f89193c45395eb5355c")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-pysmell.el

(autoload 'company-pysmell "company-pysmell" "\
`company-mode' completion back-end for pysmell.
This requires pysmell.el and pymacs.el.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-semantic" "../../../../../.emacs.d/elpa/company-0.8.12/company-semantic.el"
;;;;;;  "046609c91a7f211dc570763b448e8ac1")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-semantic.el

(autoload 'company-semantic "company-semantic" "\
`company-mode' completion back-end using CEDET Semantic.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-tempo" "../../../../../.emacs.d/elpa/company-0.8.12/company-tempo.el"
;;;;;;  "4083326d9b3926c72683262ddc818c74")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-tempo.el

(autoload 'company-tempo "company-tempo" "\
`company-mode' completion back-end for tempo.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-xcode" "../../../../../.emacs.d/elpa/company-0.8.12/company-xcode.el"
;;;;;;  "1ca1745168674d7b8ec638505e357531")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-xcode.el

(autoload 'company-xcode "company-xcode" "\
`company-mode' completion back-end for Xcode projects.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-yasnippet" "../../../../../.emacs.d/elpa/company-0.8.12/company-yasnippet.el"
;;;;;;  "5483ae24a41dbfdb33b8721a63daec4a")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-0.8.12/company-yasnippet.el

(autoload 'company-yasnippet "company-yasnippet" "\
`company-mode' back-end for `yasnippet'.

This back-end should be used with care, because as long as there are
snippets defined for the current major mode, this back-end will always
shadow back-ends that come after it.  Recommended usages:

* In a buffer-local value of `company-backends', grouped with a back-end or
  several that provide actual text completions.

  (add-hook 'js-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '((company-dabbrev-code company-yasnippet)))))

* After keyword `:with', grouped with other back-ends.

  (push '(company-semantic :with company-yasnippet) company-backends)

* Not in `company-backends', just bound to a key.

  (global-set-key (kbd \"C-c y\") 'company-yasnippet)

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/company-0.8.12/company-abbrev.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-bbdb.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-capf.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-clang.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-cmake.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-css.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-dabbrev-code.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-dabbrev.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-eclim.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-elisp.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-etags.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-files.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-gtags.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-ispell.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-keywords.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-nxml.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-oddmuse.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-pysmell.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-ropemacs.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-semantic.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-template.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-tempo.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-xcode.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company-yasnippet.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-0.8.12/company.el")
;;;;;;  (22172 37418 543801 600000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; company-autoloads.el ends here
