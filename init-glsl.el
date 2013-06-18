;;;; init-glsl.el - GLSL mode config

(add-to-list 'load-path (expand-file-name "~/.emacs.d/ext/glsl-mode"))

(autoload 'glsl-mode "glsl-mode" nil t)

(add-to-list 'auto-mode-alist
	     '("\\.\\(vert\\|frag\\|glsl\\|geom\\)$" . glsl-mode))

(provide 'init-glsl)
