;;; init-misc.el --- misc config
;;; Commentary:
;;; Code:

(fset 'yes-or-no-p 'y-or-n-p)

(line-number-mode nil)
(column-number-mode 1)
(show-paren-mode 1)
(global-subword-mode 1)
(autopair-global-mode 1)

;; set fill column
(setq-default fill-column 80)

;; delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; colorize compile output
(require 'ansi-color)

(add-hook 'compilation-filter-hook
	  (lambda ()
	      (toggle-read-only)
	      (ansi-color-apply-on-region (point-min) (point-max))
	      (toggle-read-only)))

;; scroll line by line
(setq scroll-step 1)

;; disable backup files
(setq make-backup-files nil)

;; dont pause when redisplay
(setq redisplay-dont-pause t)

;; setup cool buffer naming
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(provide 'init-misc)

;;; init-misc.el ends here
