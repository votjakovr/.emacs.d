;;; init-cc.el --- common c-like languages config
;;; Commentary:
;;; Code:

;; c config

(add-hook 'c-mode-hook (lambda () (c-set-style "gnu")))

;; c++ config

;; style according the SHOGUN guide for developer and some of the source files
(c-add-style "shogun"
	     '("stroustrup"
	       (indent-tabs-mode . t)
	       (tab-width . 4)
	       (c-offsets-alist
		(innamespace . -)
		(arglist-intro . ++)
		(arglist-cont-nonempty . ++)
		(inher-intro . ++)
		(member-init-intro . ++))))

(add-hook 'c++-mode-hook (lambda () (c-set-style "shogun")))

;; open header with c++ mode enabled
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; cc config

;; add doxymacs support for cc-mode
(defun doxymacs-c-mode-common-hook ()
  ;; requirements
  (require 'doxymacs)
  ;; enable font-lock for doxymacs
  (doxymacs-font-lock)
  ;; setup minor modes
  (doxymacs-mode 1))

(add-hook 'c-mode-common-hook 'doxymacs-c-mode-common-hook)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    ;; setup minor modes
	    (hs-minor-mode 1)
	    (linum-mode 1)
	    (fci-mode 1)

	    ;; setup local key-bindings
	    (define-key c-mode-base-map "\C-co" 'ff-find-other-file)
	    (define-key c-mode-base-map "\C-ci" 'ispell-comments-and-strings)
	    (define-key c-mode-base-map "\C-cc" 'compile)
	    (define-key c-mode-base-map [return] 'newline-and-indent)
	    (define-key c-mode-base-map "\C-m" 'newline-and-indent)))

(provide 'init-cc)

;;; init-cc.el ends here
