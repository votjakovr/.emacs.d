;;; init-octave.el --- octave mode config
;;; Commentary:
;;; Code:

(autoload 'octave-mode "octave-mod" nil t)

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

(add-hook 'octave-mode-hook
	  (lambda ()
	    ;; Setup minor modes
	    (linum-mode 1)
	    (auto-fill-mode 1)
	    (fci-mode 1)

	    ;; Setup key-bindings
	    (define-key octave-mode-map [return] 'newline-and-indent)
	    (define-key octave-mode-map "\C-m" 'newline-and-indent)))

(provide 'init-octave)

;;; init-octave.el ends here
