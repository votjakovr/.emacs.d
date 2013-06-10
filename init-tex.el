;;;; init-tex-mode.el - emacs TeX configs

(load "auctex.el" nil t t)

(setq-default TeX-master nil)
(setq TeX-parse-self t)
(setq TeX-auto-save t)

(setq TeX-default-mode 'latex-mode)

(provide 'init-tex)
