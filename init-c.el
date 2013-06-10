;;;; init-c.el - c mode config

(add-hook 'c-mode-hook
	  (lambda ()
	    (c-set-style "gnu")
	    (setq indent-tabs-mode nil)

	    ;; Setup minor modes
	    (linum-mode t)
	    (hs-minor-mode t)
	    (semantic-mode t)

	    ;; Setup local key-bindings
	    (define-key c-mode-map [return] 'newline-and-indent)))

(provide 'init-c)
