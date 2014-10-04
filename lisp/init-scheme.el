;;; init-scheme.el --- emacs scheme configs
;;; Commentary:
;;; Code:

(add-hook 'scheme-mode-hook
	  (lambda ()
	    ;; Setup minor modes
	    (linum-mode 1)
	    (hs-minor-mode 1)
	    (fci-mode 1)

	    ;; Setup local key-bindings
	    (define-key scheme-mode-map [return] 'newline-and-indent)
	    (define-key scheme-mode-map "\C-m" 'newline-and-indent)))

(provide 'init-scheme)

;;; init-scheme.el ends here
