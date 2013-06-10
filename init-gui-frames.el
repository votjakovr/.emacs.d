;;;; init-gui-frames.el - gui frames config

(setq use-file-dialog nil)
(setq use-dialog-box nil)

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; Scroll bar
(scroll-bar-mode -1)

;; Tool bar
(tool-bar-mode -1)

;; Size of the frame
(defun toggle-fullscreen ()
  (interactive)
  (if window-system
      (progn
	(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			       '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
	(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			       '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))))

(defun set-frame-size (width height)
  (if window-system
      (progn
	(add-to-list 'default-frame-alist (cons 'width width))
	(add-to-list 'default-frame-alist (cons 'height height)))))

(toggle-fullscreen)

;; (set-frame-size 132 43)

(provide 'init-gui-frames)
