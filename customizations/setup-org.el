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



(define-key global-map "\C-cc" 'org-capture)


(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/Dropbox/org-docs/etiqa-tracker.org" "Tasks")
    "\n** TODO %?
   :PROPERTIES:
   :TYPE: %^{prompt|Other|Bug|CR|Feature|Card}
   :TRACKER: %^{prompt|Other|UHC738-EPO-POS}
   :VERSION: %^{prompt|Other|v19.1.0|v20.0.4|v20.0.5|v20.0.6}
   :END:")
   ))
