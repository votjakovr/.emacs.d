;;; init-gui-frames.el --- gui frames config
;;; Commentary:
;;; Code:

;; misc configs
(setq use-file-dialog nil)
(setq use-dialog-box nil)

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)

;; toogle fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (if window-system
      (progn
	(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			       '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
	(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			       '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))))

(toggle-fullscreen)

;; revive.el config
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)

(provide 'init-gui-frames)

;;; init-gui-frames.el ends here
