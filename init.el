;;;; init.el - emacs configs

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(require 'init-cedet)
(require 'init-yasnippet)
(require 'init-auto-complete)

(require 'init-cc)
(require 'init-emacs-lisp)
(require 'init-glsl)
(require 'init-octave)
(require 'init-python)
(require 'init-scheme)

(require 'init-markdown)
(require 'init-tex)

(require 'init-gui-frames)
(require 'init-desktop)
(require 'init-theme)
(require 'init-ido)
(require 'init-misc)

(require 'init-erc)

(require 'server)
(unless (server-running-p)
  (server-start))
