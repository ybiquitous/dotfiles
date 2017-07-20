(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("\\.md\\'" . gfm-mode)
          ("\\.markdown\\'" . gfm-mode))
  :config
  (setq
    markdown-command "marked"
    markdown-content-type "application/xhtml+xml"
    markdown-css-paths '("https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.8.0/github-markdown.min.css"
                          "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/github.min.css")
    markdown-xhtml-header-content "<script src='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js'></script><script>document.addEventListener('DOMContentLoaded', function() { document.body.className = 'markdown-body'; hljs.initHighlightingOnLoad(); })</script>"))
