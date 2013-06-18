;;;; init-auto-complete.el - auto complete configs

(add-to-list 'load-path (expand-file-name "~/.emacs.d/ext/auto-complete"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ext/auto-complete/lib/popup"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ext/auto-complete/lib/ert"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ext/auto-complete/lib/fuzzy"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ext/auto-complete-clang"))

;; auto-complete config
(require 'auto-complete-config)
(ac-config-default)

(global-set-key "\M-/" 'auto-complete)

;; auto-complete-clang stuff

(require 'auto-complete-clang)
(setq clang-completion-suppress-error 't)

(setq include-paths
      (list "/usr/include/c++/4.7"
	    "/usr/include/x86_64-linux-gnu/c++/4.7/."
	    "/usr/include/c++/4.7/backward"
	    "/usr/local/include"
	    "/usr/include/x86_64-linux-gnu"
	    "/usr/include"
	    "/usr/include/clang/3.2/include"
	    "/usr/include/eigen3"
	    "/usr/include/atlas"
	    ;; persional projects includes
	    (expand-file-name "~/Projects/shogun/src")))

(setq ac-clang-flags
      (mapcar (lambda (item) (concat "-I" item))
	      (append include-paths)))

(provide 'init-auto-complete)
