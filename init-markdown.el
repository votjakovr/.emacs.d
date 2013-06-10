;;;; init-markdown.el - markdown mode config

(autoload 'markdown-mode "markdown-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.\\(md\\|markdown\\)$"
				. markdown-mode))

(provide 'init-markdown)
