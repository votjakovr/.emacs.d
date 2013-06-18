;;;; init-erc.el - emacs irc configs

(require 'erc)

;; autojoin
(require 'erc-join)
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#gsoc" "#shogun")))

;; lang
(require 'erc-lang)

;; fill config
(require 'erc-fill)
(erc-fill-mode t)

;; personal config
(setq erc-user-full-name "Roman Votyakov")
(setq erc-nick "votjakovr")
(setq erc-nick-uniquifier "_")
(setq erc-email-userid "votjakovr@gmail.com")
(setq erc-promt-for-password nil)
(setq erc-kill-queries-on-quit t)
(setq erc-kill-buffer-on-part t)

;; log config
(require 'erc-log)
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory (expand-file-name "~/.irclogs"))
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)

;; services config
(require 'erc-services)
(erc-nickserv-mode 1)
(setq erc-prompt-for-nickserv-password nil)

;; match config
(require 'erc-match)
(setq erc-keywords '("votjakovr" "Roman" "Votyakov"))

(defun erc-connect ()
  "Connect to IRC."
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "votjakovr" :full-name "Roman Votyakov" :password ""))

(setq erc-part-reason 'erc-part-reason-various)
(setq erc-quit-reason 'erc-quit-reason-various)

(setq erc-part-reason-various-alist
      '(("home" "Gone home!")
	("sleep" "Fallen asleep!")
	("drink" "Can't drink anymore!")
	("go" "Need to go!")
	("yow" erc-part-reason-zippy)
	("version" erc-part-reason-normal)))

(provide 'init-erc)
