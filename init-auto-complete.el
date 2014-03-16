;;; init-auto-complete.el --- auto complete config
;;; Commentary:
;;; Code:

(require 'auto-complete-config)

;; don't start auto completion automaticly
(setq ac-auto-start nil)

;; setup default auto-complete sources
(setq-default ac-sources '(ac-source-abbrev
			   ac-source-dictionary
			   ac-source-words-in-same-mode-buffers))

(add-hook 'auto-complete-mode-hook 'ac-common-setup)
(global-auto-complete-mode t)
(global-set-key (kbd "<C-tab>") 'auto-complete)

;; setup auto complete for emacs lisp
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)

;; setup auto complete for python
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; setup auto complete clang async for c/c++/obective-c
(require 'auto-complete-clang-async)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (setq clang-completion-suppress-error t)
	    (setq ac-clang-cflags (mapcar (lambda (item) (concat "-I" item))
					  (list "/usr/include/c++/4.7"
						"/usr/include/x86_64-linux-gnu/c++/4.7/"
						"/usr/include/c++/4.7/backward"
						"/usr/local/include"
						"/usr/include/x86_64-linux-gnu"
						"/usr/include"
						"/usr/include/eigen3"
						"/usr/include/atlas")))
	    (setq ac-sources '(ac-source-clang-async))
	    (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
	    (ac-clang-launch-completion-process)
	    (ac-clang-update-cmdlineargs)))

(provide 'init-auto-complete)

;;; init-auto-complete.el ends here
