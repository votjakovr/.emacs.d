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

(add-to-list 'ido-ignore-buffers "\\*Completions")
(add-to-list 'ido-ignore-buffers "\\*Ido Completions")
(add-to-list 'ido-ignore-buffers "\\*Backtrace")
(add-to-list 'ido-ignore-buffers "\\*Messages")
(add-to-list 'ido-ignore-buffers "\\*Disabled Command")
(add-to-list 'ido-ignore-buffers "\\*epc")
(add-to-list 'ido-ignore-buffers "\\*clang")

(provide 'init-ido)

;;; init-ido.el ends here
