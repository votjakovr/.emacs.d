;;;; init-emacs-lisp.el - el config

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)

	    ;; Setup minor modes
	    (linum-mode 1)

	    ;; Setup local key-bindings
	    (define-key emacs-lisp-mode-map [return] 'newline-and-indent)))

(provide 'init-emacs-lisp)
