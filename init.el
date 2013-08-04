;;; init.el --- emacs configs
;;; Commentary:
;;; Code:

(add-to-list 'load-path user-emacs-directory)

(require 'init-elpa)

(require 'init-auto-complete)
(require 'init-yasnippet)

(require 'init-cc)
(require 'init-emacs-lisp)
(require 'init-glsl)
(require 'init-octave)
(require 'init-python)
(require 'init-scheme)
(require 'init-ruby)

(require 'init-markdown)
(require 'init-latex)

(require 'init-gui-frames)
(require 'init-theme)
(require 'init-ido)
(require 'init-misc)

(require 'server)
(unless (server-running-p) (server-start))

;;; init.el ends here
