;;;; init-desktop.el - desktop config

(setq desktop-path (list (expand-file-name "~/.emacs.d")))
(setq desktop-missing-file-warning nil)
(desktop-save-mode 1)

(add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)
(add-to-list 'desktop-locals-to-save 'tab-width)

(setq session-save-file (expand-file-name ".session" "~/.emacs.d"))
(add-hook 'after-init-hook 'session-initialize)

(defun ignore-semantic-handler (desktop-buffer-file-name) nil)

(add-to-list 'desktop-minor-mode-handlers '(ede-minor-mode . ignore-semantic-handler))
(add-to-list 'desktop-minor-mode-handlers '(srecode-minor-mode . ignore-semantic-handler))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-scheduler-mode . ignore-semantic-handler))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-summary-mode . ignore-semantic-handler))
(add-to-list 'desktop-minor-mode-handlers '(semantic-mru-bookmark-mode . ignore-semantic-handler))
(add-to-list 'desktop-minor-mode-handlers '(global-cedet-m3-minor-mode . ignore-semantic-handler))

(provide 'init-desktop)
