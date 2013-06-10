;;;; init-cedet.el - cedet config

(add-to-list 'load-path "~/.emacs.d/ext")

;; semantic stuff
(require 'semantic)
(require 'semantic/sb)

(add-to-list 'semantic-default-submodes
	     'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes
	     'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes
	     'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes
	     'global-semantic-show-unmatched-syntax-mode)

;; (semantic-add-system-include "/usr/include/c++/4.7" 'c++-mode)

;; semantic clang stuff
(require 'semantic-clang)
(semantic-clang-activate)

;; ede stuff
;; (global-ede-mode 1)

(provide 'init-cedet)
