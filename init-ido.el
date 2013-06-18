;;;; init-ido.el - ido config

(ido-mode t)

(iswitchb-mode t)

(add-to-list 'iswitchb-buffer-ignore "\\*Completions")
(add-to-list 'iswitchb-buffer-ignore "\\*Ido Completions")
(add-to-list 'iswitchb-buffer-ignore "\\*Backtrace")
(add-to-list 'iswitchb-buffer-ignore "irc\\.")

(provide 'init-ido)
