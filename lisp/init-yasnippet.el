;;; init-yasnippet.el --- yasnippet config
;;; Commentary:
;;; Code:

(require 'yasnippet)
(add-to-list 'yas-snippet-dirs (expand-file-name "~/.emacs.d/snippets"))
(yas-global-mode 1)

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
