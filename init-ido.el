;;; init-ido.el --- ido config
;;; Commentary:
;;; Code:

;; setup ido
(require 'ido)

(ido-mode t)

(setq ido-enable-last-directory-history nil)
(setq ido-record-commands nil)
(setq ido-max-work-directory-list 0)
(setq ido-max-work-file-list 0)

;; setup iswitchb
(require 'iswitchb)

(iswitchb-mode t)

(add-to-list 'iswitchb-buffer-ignore "\\*Completions")
(add-to-list 'iswitchb-buffer-ignore "\\*Ido Completions")
(add-to-list 'iswitchb-buffer-ignore "\\*Backtrace")
(add-to-list 'iswitchb-buffer-ignore "irc\\.")
(add-to-list 'iswitchb-buffer-ignore "\\*Messages")
(add-to-list 'iswitchb-buffer-ignore "\\*clang")
(add-to-list 'iswitchb-buffer-ignore "\\*Help")
(add-to-list 'iswitchb-buffer-ignore "\\*Disabled Command")

(provide 'init-ido)

;;; init-ido.el ends here
