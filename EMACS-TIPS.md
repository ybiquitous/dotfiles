# Emacs Tips

## Key bindings

| Key                     | Description                                | Example            |
| ----------------------- | ------------------------------------------ | ------------------ |
| <kbd>C-? f</kbd>        | `describe-function`                        |                    |
| <kbd>C-? k</kbd>        | `describe-key`                             |                    |
| <kbd>C-? b</kbd>        | `describe-bindings`                        |                    |
| <kbd>C-M-s</kbd>        | `isearch-forward-regexp`                   |                    |
| <kbd>M-s w</kbd>        | `isearch-forward-word`                     |                    |
| <kbd>C-q</kbd>          | `quoted-insert`                            | <kbd>C-q TAB</kbd> |
| <kbd>M-!</kbd>          | `shell-command`                            |                    |
| <kbd>M-&</kbd>          | `async-shell-command`                      |                    |
| <kbd>C-u M-!</kbd>      | Insert `shell-command` output input buffer |                    |
| <kbd>C-u M-&#124;</kbd> | `shell-command-on-region` from stdin       |                    |
| <kbd>C-x SPC</kbd>      | `rectangle-mark-mode`                      |                    |
| <kbd>C-x v g</kbd>      | `vc-annotate` (`git blame`)                |                    |
| <kbd>C-x v =</kbd>      | `vc-diff` (`git diff`)                     |                    |
| <kbd>C-x v l</kbd>      | `vc-print-log` (`git log`)                 |                    |
| <kbd>C-c C-c p</kbd>    | `markdown-preview`                         |                    |
| <kbd>C-c p f</kbd>      | `projectile-find-file`                     |                    |

## Useful commands

| Key                                                         | Description              |
| ----------------------------------------------------------- | ------------------------ |
| <kbd>M-x align-regexp</kbd>                                 | Algin current region     |
| <kbd>M-: (byte-recompile-directory "~/.emacs.d/" 0 t)</kbd> | Recompile all *.el       |
| <kbd>yas-reload-all</kbd>                                   | Reload all snippets      |

## Windows

```bat
mklink %USERPROFILE%\.emacs.d\inits\99_env.el %USERPROFILE%\99_env.el
```
