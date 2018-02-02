(bind-key "C-h"     'delete-backward-char)
(bind-key "C-?"     'help-command)
(bind-key "C-c l"   'toggle-truncate-lines)
(bind-key "C-c C-v" 'browse-url-of-buffer)
(bind-key "C-c C-r" 'eval-buffer)
(bind-key "C-c C-g" 'vc-git-grep)
(bind-key "C-c C-k" 'kill-buffer-and-window)

(defun my/keys ()
  "Display my favorite key bindings."
  (interactive)
  (display-message-or-buffer "=== My Keys
C-? f          describe-function
C-? k          describe-key
C-? b          describe-bindings
C-M-s          isearch-forward-regexp
M-s w          isearch-forward-word
C-q            quoted-insert (e.g. `C-q TAB')
M-!            shell-command
M-&            async-shell-command
C-u M-!        shell-command
C-u M-|        shell-command-on-region
C-x SPC        rectangle-mark-mode
C-x v g        vc-annotate (git blame)
C-x v =        vc-diff (git diff)
C-x v l        vc-print-log (git log)
C-c C-c p      markdown-preview
C-c p f        projectile-find-file

=== My Commands
M-x align-regexp                                    Algin current region
M-: (byte-recompile-directory \"~/.emacs.d/\" 0 t)    Recompile all *.el
M-x yas-reload-all                                  Reload all snippets
" "*My Keys*"))
