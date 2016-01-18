;;; editorconfig-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "editorconfig" "../../../../../.emacs.d/elpa/editorconfig-0.7.0/editorconfig.el"
;;;;;;  "62987650a5dcb229d956a9cda724b006")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/editorconfig-0.7.0/editorconfig.el

(autoload 'editorconfig-apply "editorconfig" "\
Apply EditorConfig properties for current buffer.

\(fn)" t nil)

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

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/editorconfig-0.7.0/editorconfig-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/editorconfig-0.7.0/editorconfig.el")
;;;;;;  (22172 37108 545737 800000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; editorconfig-autoloads.el ends here
