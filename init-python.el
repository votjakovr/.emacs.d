;;;; init-python-mode.el - python mode config

(add-hook 'python-mode-hook
	  (lambda ()
    	    (setq tab-width 4)

	    ;; Setup minor modes
	    (linum-mode 1)
	    (hs-minor-mode 1)

	    ;; Setup key-bindings
	    (define-key octave-mode-map [return]
	    'newline-and-indent)))

(provide 'init-python)
