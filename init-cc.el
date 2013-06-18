;;;; init-cc.el - common c-like languages config

;; c config

(add-hook 'c-mode-hook
	  (lambda ()
	    (c-set-style "gnu")
	    (setq indent-tabs-mode nil)))

;; c++ config

;; add eassist support for c++ mode
(defun eassist-c++-mode-hook ()
  ;; requirements
  (require 'eassist)

  ;; setup local key-bindings
  (define-key c++-mode-map "\C-ct" 'eassist-switch-h-cpp)
  (define-key c++-mode-map "\C-cj" 'eassist-jump-to-method)
  (define-key c++-mode-map "\C-ce" 'eassist-list-methods))

;; config according The SHOGUN guide for developer
(defun shogun-c++-mode-hook ()
  (c-set-style "stroustrup")
  (setq indent-tabs-mode 1)
  (setq tab-width 4))

(add-hook 'c++-mode-hook 'eassist-c++-mode-hook)
(add-hook 'c++-mode-hook 'shogun-c++-mode-hook)

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

	    ;; setup sources for autocompletion
	    (setq ac-sources '(ac-source-clang
			       ac-source-semantic
			       ac-source-dictionary))

	    ;; setup local key-bindings
	    ;; (define-key c-mode-base-map [(control return)]
	    ;;   'semantic-ia-complete-symbol)
	    ;; (define-key c-mode-base-map "\C-c?"
	    ;;   'semantic-ia-complete-symbol-menu)
	    ;; (define-key c-mode-base-map "\C-c>"
	    ;;   'semantic-complete-analyze-inline)
	    ;; (define-key c-mode-base-map "\C-c\C-r" 'semantic-symref)
	    (define-key c-mode-base-map [return] 'newline-and-indent)
	    (define-key c-mode-base-map "\C-m" 'newline-and-indent)))

(provide 'init-cc)
