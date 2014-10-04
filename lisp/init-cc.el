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

;; cc config

(defun doxymacs-return ()
  "Advanced `newline' command for Javadoc multiline comments.
Insert a `*' at the beggining of the new line if inside of a
comment."
  (interactive "*")
  (let* ((last (point))
         (is-inside
          (if (search-backward "*/" nil t)
              ;; there are some comment endings - search forward
              (search-forward "/*" last t)
            ;; it's the only comment - search backward
            (goto-char last)
            (search-backward "/*" nil t))))

    ;; go to last char position
    (goto-char last)

    ;; the point is inside some comment, insert `*'
    (if is-inside
        (progn
          (newline-and-indent)
          (insert "* "))
      ;; else insert only new-line
      (newline-and-indent))))

;; add doxymacs support for cc-mode
(defun doxymacs-c-mode-common-hook ()
  ;; requirements
  (require 'doxymacs)
  ;; enable font-lock for doxymacs
  (doxymacs-font-lock)
  ;; setup minor modes
  (doxymacs-mode 1)
  ;; setup local key-bindings
  (define-key c-mode-base-map [return] 'doxymacs-return)
  (define-key c-mode-base-map "\C-m" 'doxymacs-return))

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
	    (define-key c-mode-base-map "\C-cc" 'compile)))

(provide 'init-cc)

;;; init-cc.el ends here
