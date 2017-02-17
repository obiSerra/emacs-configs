(require 'org)

; TODO closed timestamp
(setq org-log-done 'time)

; TODO closed note on timestamp 
(setq org-log-done 'note)

; TODO states
  (setq org-todo-keywords
       '((sequence "TODO" "IN-PROGRESS" "PAUSED" "BLOCKED" "|" "DONE" "REJECTED" "MOVED-TO" )))
;; active Babel languages

(setq org-babel-clojure-backend 'cider)
(require 'cider)

(require 'ob-python)
(require 'ob-clojure)
(require 'ob-js)
(require 'ob-lisp)
(require 'ob-org)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (clojure . t)
   (js . t)
   (emacs-lisp . t)
   ))


; Calendar syncronization


; some basic commands
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)



; Agenda

(setq org-agenda-files (list "~/Dropbox/notes/work.org"
                             "~/Dropbox/notes/nerd.org"))
