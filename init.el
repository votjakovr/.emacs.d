;;;; init.el - emacs configs

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(require 'init-auto-complete)
(require 'init-cedet)
(require 'init-gui-frames)
(require 'init-ispell)
(require 'init-misc)
(require 'init-theme)
(require 'init-yasnippet)

(require 'init-c)
(require 'init-c++)
(require 'init-emacs-lisp)
(require 'init-glsl)
(require 'init-octave)
(require 'init-python)
(require 'init-scheme)

(require 'init-doxygen)
(require 'init-markdown)
(require 'init-tex)

(require 'server)
(unless (server-running-p)
  (server-start))
