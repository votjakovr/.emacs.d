;;; init-glsl.el --- GLSL mode config
;;; Commentary:
;;; Code:

(autoload 'glsl-mode "glsl-mode" nil t)

(add-to-list 'auto-mode-alist
	     '("\\.\\(vert\\|frag\\|glsl\\|geom\\)$" . glsl-mode))

(add-hook 'glsl-mode-hook
	  (lambda ()
	    ;; setup minor modes
	    (linum-mode 1)
	    (hs-minor-mode 1)
	    (fci-mode 1)

	    ;; setup key-bindings
	    (define-key glsl-mode-map [return] 'newline-and-indent)
	    (define-key glsl-mode-map "\C-m" 'newline-and-indent)))

(provide 'init-glsl)

;;; init-glsl.el ends here
