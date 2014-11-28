;;; es-lib-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (es-ack-pin-folder es-ack-replace-symbol es-query-replace-symbol-at-point
;;;;;;  es-manage-unsaved-buffers es-ido-like-helm es-ido-like-helm
;;;;;;  es-comment-dwim es-c-expand-region es-mouse-yank-replace-symbol
;;;;;;  es-mouse-copy-symbol es-new-empty-buffer es-jump-line es-push-line
;;;;;;  es-find-function-bound-to es-kill-buffer-dont-ask) "es-lib-core-functions"
;;;;;;  "es-lib-core-functions.el" (21624 1997 407975 127000))
;;; Generated autoloads from es-lib-core-functions.el

(autoload 'es-kill-buffer-dont-ask "es-lib-core-functions" "\


\(fn &optional BUFFER)" t nil)

(autoload 'es-find-function-bound-to "es-lib-core-functions" "\


\(fn KEY-SEQUENCE)" t nil)

(autoload 'es-push-line "es-lib-core-functions" "\
beginning-of-line + open line.

\(fn)" t nil)

(autoload 'es-jump-line "es-lib-core-functions" "\
end-of-line + newline.

\(fn)" t nil)

(autoload 'es-new-empty-buffer "es-lib-core-functions" "\


\(fn)" t nil)

(defvar es-highlighter-colors '("DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))

(autoload 'es-mouse-copy-symbol "es-lib-core-functions" "\


\(fn EVENT)" t nil)

(autoload 'es-mouse-yank-replace-symbol "es-lib-core-functions" "\


\(fn EVENT)" t nil)

(autoload 'es-c-expand-region "es-lib-core-functions" "\
A simplee version of expand-region for c-like languages.
Marks the symbol on first call, then marks the statement.

\(fn)" t nil)

(autoload 'es-comment-dwim "es-lib-core-functions" "\


\(fn &optional ARG)" t nil)

(autoload 'es-ido-like-helm "es-lib-core-functions" "\
Choose from a concatenated list of buffers and recent files.

\(fn &optional THIS-MODE-ONLY)" t nil)

(autoload 'es-ido-like-helm "es-lib-core-functions" "\
Choose from a concatenated list of buffers and recent files.

\(fn &optional THIS-MODE-ONLY)" t nil)

(autoload 'es-manage-unsaved-buffers "es-lib-core-functions" "\
Similar to what happends when emacs is about to quit.

\(fn)" t nil)

(autoload 'es-query-replace-symbol-at-point "es-lib-core-functions" "\


\(fn)" t nil)

(autoload 'es-ack-replace-symbol "es-lib-core-functions" "\
Repalace symbol at point, or region contents in multiple
files.

\(fn FROM-SYMBOL-OR-STRING TO-SYMBOL-OR-STRING &key DIRECTORY AUTO-SAVE FINISH-FUNC SILENT)" t nil)

(autoload 'es-ack-pin-folder "es-lib-core-functions" "\
Set ack root directory for one buffer only.
Ack won't prompt for a directory name in that buffer.

\(fn FOLDER)" t nil)

;;;***

;;;### (autoloads nil nil ("es-lib-buffer-local-set-key.el" "es-lib-core-macros.el"
;;;;;;  "es-lib-lexical.el" "es-lib-pkg.el" "es-lib-readme-generator.el"
;;;;;;  "es-lib-text-navigate.el" "es-lib-total-line.el" "es-lib.el")
;;;;;;  (21624 1997 469321 621000))

;;;***

(provide 'es-lib-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; es-lib-autoloads.el ends here
