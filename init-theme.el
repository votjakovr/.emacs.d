;;;; init-theme.el - theme loading config

(add-to-list 'load-path "~/.emacs.d/ext/color-theme-solarized")

(require 'color-theme-solarized)
(color-theme-solarized-dark)

(provide 'init-theme)
