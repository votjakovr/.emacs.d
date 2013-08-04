;;; init-markdown.el --- markdown mode config
;;; Commentary:
;;; Code:

(autoload 'markdown-mode "markdown-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.\\(md\\|markdown\\)$" . markdown-mode))

(provide 'init-markdown)

;;; init-markdown ends here
