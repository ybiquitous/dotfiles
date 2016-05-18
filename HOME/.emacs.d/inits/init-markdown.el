(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(add-hook 'markdown-mode-hook
          (lambda()
            (custom-set-variables
             '(markdown-command "marked")
             '(markdown-content-type "application/xhtml+xml")
             '(markdown-css-paths
               '("https://sindresorhus.com/github-markdown-css/github-markdown.css"
                 "https://cdn.jsdelivr.net/highlight.js/9.4.0/styles/default.min.css"))
             '(markdown-xhtml-header-content "
<script>document.addEventListener('DOMContentLoaded', function() { document.body.className = 'markdown-body' })</script>
<script src='https://cdn.jsdelivr.net/highlight.js/9.4.0/highlight.min.js'></script>
<script>hljs.initHighlightingOnLoad();</script>")
             )))


(provide 'init-markdown)
