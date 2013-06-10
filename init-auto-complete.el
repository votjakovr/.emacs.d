;;;; init-auto-complete.el - auto complete configs

(add-to-list 'load-path "~/.emacs.d/ext/auto-complete")
(add-to-list 'load-path "~/.emacs.d/ext/auto-complete/lib/popup")
(add-to-list 'load-path "~/.emacs.d/ext/auto-complete/lib/ert")
(add-to-list 'load-path "~/.emacs.d/ext/auto-complete/lib/fuzzy")
(add-to-list 'load-path "~/.emacs.d/ext/auto-complete-clang")

;; auto-complete stuff

(require 'auto-complete-config)
(ac-config-default)
(setq ac-sources (append '(ac-source-semantic
			   ac-source-yasnippet
			   ac-source-abbrev
			   ac-source-dictionary
			   ac-source-words-in-same-mode-buffers)
			 ac-sources))
(setq ac-auto-show-menu t)

;; auto-complete-clang stuff

(require 'auto-complete-clang)

(setq clang-completion-suppress-error 't)

(setq include-paths
      '("/usr/include/"
	"/usr/include/c++/4.7"
	"/usr/include/x86_64-linux-gnu/c++/4.7"
	"/usr/include/x86_64-linux-gnu"
	"/usr/include/clang/3.2/include"
	"/usr/include/eigen3"
	"/usr/local/include/arprec"))

(setq ac-clang-flags
      (mapcar (lambda (item) (concat "-I" item))
	      (append include-paths)))

;; common stuff
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

(provide 'init-auto-complete)
