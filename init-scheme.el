;;;; init-scheme-mode.el - emacs scheme configs

(add-hook 'scheme-mode-hook
	  (lambda ()
	    ;; Setup minor modes
	    (linum-mode 1)
	    (hs-minor-mode 1)

	    ;; Setup local key-bindings
	    (define-key scheme-mode-map [return] 'newline-and-indent)))

(provide 'init-scheme)
