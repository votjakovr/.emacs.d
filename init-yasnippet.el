;;;; init-yasnippet.el - yasnippet config

(add-to-list 'load-path "~/.emacs.d/ext/yasnippet")

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"
			 "~/.emacs.d/ext/yasnippet/snippets"))
(yas-global-mode 1)

(provide 'init-yasnippet)
