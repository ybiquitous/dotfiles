(bind-key "C-?"     'help-command)
(bind-key "C-c C-g" 'vc-git-grep)
(bind-key "C-c C-k" 'kill-buffer-and-window)
(bind-key "C-c m p" 'my/prettier)
(bind-key "C-c m P" 'my/prettier-mode)
(bind-key "C-c C-r" 'eval-buffer)
(bind-key "C-c C-v" 'browse-url-of-buffer)
(bind-key "C-c c l" 'lower-camel-case-word)
(bind-key "C-c c u" 'upper-camel-case-word)
(bind-key "C-c d"   'dasherize-word)
(bind-key "C-c l"   'toggle-truncate-lines)
(bind-key "C-h"     'delete-backward-char)

(defun my/keys ()
  "Display my favorite key bindings."
  (interactive)
  (display-message-or-buffer "=== My Keys
C-? b          describe-bindings
C-? f          describe-function
C-? k          describe-key
C-M-s          isearch-forward-regexp
C-c C-c p      markdown-preview
C-c C-g        vc-git-grep
C-c C-k        kill-buffer-and-window
C-c C-p        my/prettier
C-c C-r        eval-buffer
C-c c l        lower-camel-case-word
C-c c u        upper-camel-case-word
C-c c v        browse-url-of-buffer
C-c d          dasherize-word
C-c l          toggle-truncate-lines
C-c C-p f      projectile-find-file
C-q            quoted-insert (e.g. `C-q TAB')
C-u M-!        shell-command
C-u M-|        shell-command-on-region
C-x C-+        text-scale-adjust (increase)
C-x C--        text-scale-adjust (decrease)
C-x C-0        text-scale-adjust (reset)
C-x SPC        rectangle-mark-mode
C-x v =        vc-diff (git diff)
C-x v g        vc-annotate (git blame)
C-x v l        vc-print-log (git log)
M-!            shell-command
M-&            async-shell-command
M-s w          isearch-forward-word

=== My Commands
M-x align-regexp                                    Algin current region
M-x yas-reload-all                                  Reload all snippets
M-: (byte-recompile-directory \"~/.emacs.d/\" 0 t)  Recompile all *.el
" "*My Keys*"))
