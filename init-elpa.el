;;; init-elpa.el --- package config
;;; Commentary:
;;; Code:

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(provide 'init-elpa)

;;; init-elpa.el ends here
