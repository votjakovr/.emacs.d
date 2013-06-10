;;;; init-c++.el - c++ mode config

(add-hook 'c++-mode-hook
	  (lambda ()
	    (c-set-style "stroustrup")
	    (setq indent-tabs-mode t)
	    (setq tab-width 4)

	    ;; Setup minor modes
	    (linum-mode t)
	    (hs-minor-mode t)
	    (semantic-mode t)

	    ;; Setup local key-bindings
	    (define-key c++-mode-map [return] 'newline-and-indent)
	    (define-key c++-mode-map (kbd "<C-return>") 'ac-complete-clang)))

(provide 'init-c++)
