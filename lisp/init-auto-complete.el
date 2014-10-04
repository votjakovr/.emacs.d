;;; init-auto-complete.el --- auto complete config
;;; Commentary:
;;; Code:

(require 'auto-complete-config)

;; don't start auto completion automaticly
(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)

;; setup default auto-complete sources
(setq-default ac-sources '(ac-source-abbrev
			   ac-source-dictionary
			   ac-source-words-in-same-mode-buffers))

(add-hook 'auto-complete-mode-hook 'ac-common-setup)
(global-auto-complete-mode t)
(global-set-key (kbd "<C-tab>") 'auto-complete)

;; setup auto complete for emacs lisp
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)

;; setup auto complete clang for c/c++
(require 'auto-complete-clang)
(require 'auto-complete-c-headers)

(defun get-include-dirs ()
  (let* ((command-result (shell-command-to-string
			  "echo \"\" | clang++ -v -x c++ -E -"))
         (start-string "#include <...> search starts here:\n")
         (end-string "End of search list.\n")
         (start-pos (string-match start-string command-result))
         (end-pos (string-match end-string command-result))
         (include-string
	  (substring command-result
		     (+ start-pos (length start-string)) end-pos)))
    (split-string include-string)))

(defun c-and-cpp-autocompletion ()
  (setq ac-sources
	(append '(ac-source-clang ac-source-yasnippet ac-source-c-headers)
		ac-sources))
  (setq ac-clang-flags
	(mapcar (lambda (item) (concat "-I" item)) (get-include-dirs))))

(add-hook 'c-mode-hook 'c-and-cpp-autocompletion)
(add-hook 'c++-mode-hook 'c-and-cpp-autocompletion)

;; setup auto complete for python
(require 'jedi)

(autoload 'jedi:setup "jedi" nil t)
(setq jedi:complete-on-dot t)

;; method 1
(defun get-project-root (buf repo-file &optional init-file)
  "Just uses the vc-find-root function to figure out the project root.
Won't always work for some directory layouts."
(let* ((buf-dir (expand-file-name (file-name-directory (buffer-file-name buf))))
       (project-root (vc-find-root buf-dir repo-file)))
  (if project-root
      (expand-file-name project-root)
    nil)))

;; method 2: slightly more robust
(defun get-project-root-with-file (buf repo-file &optional init-file)
  "Guesses that the python root is the less 'deep' of either:
-- the root directory of the repository, or
-- the directory before the first directory after the root
having the init-file file (e.g., '__init__.py'."
  ;; make list of directories from root, removing empty
  (defun make-dir-list (path)
    (delq nil (mapcar (lambda (x) (and (not (string= x "")) x))
		      (split-string path "/"))))
  ;; convert a list of directories to a path starting at "/"
  (defun dir-list-to-path (dirs)
    (mapconcat 'identity (cons "" dirs) "/"))
  ;; a little something to try to find the "best" root directory
  (defun try-find-best-root (base-dir buffer-dir current)
    (cond
     (base-dir ;; traverse until we reach the base
      (try-find-best-root (cdr base-dir) (cdr buffer-dir)
			  (append current (list (car buffer-dir)))))
     (buffer-dir ;; try until we hit the current directory
      (let* ((next-dir (append current (list (car buffer-dir))))
	     (file-file (concat (dir-list-to-path next-dir) "/" init-file)))
	(if (file-exists-p file-file)
	    (dir-list-to-path current)
	  (try-find-best-root nil (cdr buffer-dir) next-dir))))
     (t nil)))
  (let* ((buffer-dir (expand-file-name (file-name-directory
					(buffer-file-name buf))))
	 (vc-root-dir (vc-find-root buffer-dir repo-file)))
    (if (and init-file vc-root-dir)
	(try-find-best-root
	 (make-dir-list (expand-file-name vc-root-dir))
	 (make-dir-list buffer-dir)
	 '())
      vc-root-dir))) ;; default to vc root if init file not given

(defvar jedi-config:vcs-root-sentinel ".git")
(defvar jedi-config:python-module-sentinel "__init__.py")

;; set this variable to find project root
(defvar jedi-config:find-root-function 'get-project-root-with-file)

(defun current-buffer-project-root ()
  (funcall jedi-config:find-root-function
	   (current-buffer)
	   jedi-config:vcs-root-sentinel
	   jedi-config:python-module-sentinel))

(defun jedi-config:setup-server-args ()
  ;; little helper macro for building the arglist
  (defmacro add-args (arg-list arg-name arg-value)
    `(setq ,arg-list (append ,arg-list (list ,arg-name ,arg-value))))
  ;; and now define the args
  (let ((project-root (current-buffer-project-root)))
    (make-local-variable 'jedi:server-args)
    (when project-root
      (add-args jedi:server-args "--sys-path" project-root))))

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi-config:setup-server-args)

(provide 'init-auto-complete)

;;; init-auto-complete.el ends here
