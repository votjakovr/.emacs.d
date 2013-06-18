;;;; init-cedet.el - cedet config

(load-file (expand-file-name "~/.emacs.d/ext/cedet/cedet-devel-load.el"))
(load-file (expand-file-name "~/.emacs.d/ext/cedet/contrib/cedet-contrib-load.el"))

;; semantic stuff
;; (semantic-load-enable-code-helpers)

;; (require 'semantic/bovine/c)
;; (require 'semantic/bovine/clang)
;; (semantic-clang-activate)

;; additional headers
;; (setq clang-include-path "/usr/include/clang/3.2/include")
;; (semantic-add-system-include clang-include-path)
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file
;; 	     (concat clang-include-path "/stddef.h"))

;; (setq eigen3-include-path "/usr/include/eigen3")
;; (add-to-list 'auto-mode-alist (cons eigen3-include-path 'c++-mode))
;; (semantic-add-system-include eigen3-include-path 'c++-mode)
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file
;; 	     (concat eigen3-include-path "/Eigen/src/Core/util/Macros.h"))

;; (setq lzo-include-path "/usr/include/lzo")
;; (semantic-add-system-include lzo-include-path)
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file
;; 	     (concat lzo-include-path "/lzodefs.h"))

;; (setq json-include-path "/usr/include/json")
;; (semantic-add-system-include json-include-path)
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file
;; 	     (concat json-include-path "/json_config.h"))

;; (setq atlas-include-path "/usr/include/atlas")
;; (semantic-add-system-include atlas-include-path)

;; (setq libxml2-include-path "/usr/include/libxml2")
;; (semantic-add-system-include libxml2-include-path)
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file
;; 	     (concat libxml2-include-path "/libxml/xmlversion.h"))

;; srecode stuff
;; (global-srecode-minor-mode 1)

;; ede stuff
;; (global-ede-mode 1)
;; (ede-enable-generic-projects)

;; shogun project definition
;; (ede-cpp-root-project "shogun"
;; 		      :name "shogun"
;; 		      :version "2.2.0"
;; 		      :file "~/Projects/shogun/Makefile"
;; 		      :include-path '("/src")
;; 		      :web-site-url "http://www.shogun-toolbox.org"
;; 		      :mailinglist "shogun-list@shogun-toolbox.org"
;; 		      :system-include-path '("/usr/include/c++/4.7"
;; 					     "/usr/include/x86_64-linux-gnu/c++/4.7/."
;; 					     "/usr/include/c++/4.7/backward"
;; 					     "/usr/local/include"
;; 					     "/usr/include/x86_64-linux-gnu"
;; 					     "/usr/include"
;; 					     "/usr/include/clang/3.2/include"
;; 					     "/usr/include/eigen3"
;; 					     "/usr/include/json"
;; 					     "/usr/include/libxml2"
;; 					     "/usr/include/atlas")
;; 		      :spp-files '("shogun/base/Parallel.h"
;; 				   "shogun/base/SGObject.h"
;; 				   "shogun/io/SGIO.h"
;; 				   "shogun/lib/common.h"
;; 				   "shogun/lib/config.h"
;; 				   "shogun/lib/memory.h"
;; 				   "shogun/lib/versionstring.h")
;; 		      :compile-command "cd ~/Projects/shogun/src && make -j 4")

(provide 'init-cedet)
