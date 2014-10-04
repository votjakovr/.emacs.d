;;; init-emacs-lisp.el --- emacs lisp config
;;; Commentary:
;;; Code:

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    ;; Setup minor modes
	    (linum-mode 1)
	    (fci-mode 1)

	    ;; Setup local key-bindings
	    (define-key emacs-lisp-mode-map [return] 'newline-and-indent)
	    (define-key emacs-lisp-mode-map "\C-m" 'newline-and-indent)))

(provide 'init-emacs-lisp)

;;; init-emacs-lisp.el ends here
