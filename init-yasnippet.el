;;;; init-yasnippet.el - yasnippet config

(add-to-list 'load-path (expand-file-name "~/.emacs.d/ext/yasnippet"))

(require 'yasnippet)
(setq yas-snippet-dirs (list (expand-file-name "~/.emacs.d/snippets")
			     (expand-file-name "~/.emacs.d/ext/yasnippet/snippets")))
(yas-global-mode 1)

(provide 'init-yasnippet)
