;;;; init-octave.el - octave mode config

(autoload 'octave-mode "octave-mod" nil t)

(add-hook 'octave-mode-hook
	  (lambda ()

	    ;; Setup minor modes
	    (linum-mode t)
	    (auto-fill-mode t)

	    ;; Setup key-bindings
	    (define-key octave-mode-map [return] 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

(provide 'init-octave)
