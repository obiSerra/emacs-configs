(require 'org)

; TODO closed timestamp
(setq org-log-done 'time)

; TODO closed note on timestamp 
(setq org-log-done 'note)


;; active Babel languages

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


