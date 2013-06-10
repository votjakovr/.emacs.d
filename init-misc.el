;;;; init-misc.el - misc configs

(fset 'yes-or-no-p 'y-or-n-p)

(column-number-mode 1)
(show-paren-mode 1)
(global-hl-line-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-misc)
