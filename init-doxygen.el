;;;; init-doxygen.el - doxygen mode configuration

(require 'doxymacs)

(add-hook 'font-lock-mode-hook
	  (lambda ()
	    (if (or (eq major-mode 'c-mode)
		    (eq major-mode 'c++-mode))
		(doxymacs-font-lock))))

(add-hook 'c++-mode-hook 'doxymacs-mode)
(add-hook 'c-mode-hook 'doxymacs-mode)

(provide 'init-doxygen)
