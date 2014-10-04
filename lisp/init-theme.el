;;; init-theme.el --- theme loading config
;;; Commentary:
;;; Code:

(require 'color-theme)

(setq color-theme-load-all-themes nil)

(if window-system
    (load-theme 'monokai t))

(provide 'init-theme)

;;; init-theme.el ends here
