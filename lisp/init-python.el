;;; init-python.el --- python mode config
;;; Commentary:
;;; Code:

(require 'tramp)

(add-hook 'python-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
    	    (setq tab-width 4)

	    ;; setup minor modes
	    (linum-mode 1)
	    (hs-minor-mode 1)
	    (fci-mode 1)

	    ;; setup key-bindings
	    (define-key python-mode-map [return] 'newline-and-indent)
	    (define-key python-mode-map "\C-m" 'newline-and-indent)
	    (define-key python-mode-map "\C-ci" 'ispell-comments-and-strings)
	    (define-key python-mode-map "\C-cc" 'comment-region)
	    (define-key python-mode-map "\C-cp" 'pylint)))

(provide 'init-python)

;;; init-python.el ends here
