(require 'org)

; TODO closed timestamp
(setq org-log-done 'time)

; TODO closed note on timestamp
(setq org-log-done 'note)

; TODO states
(setq org-todo-keywords
      '((sequence "TODO" "PAUSED" "BLOCKED" "IN-PROGRESS" "WAIT" "|" "DONE" "REJECTED" "MOVED-TO" )))

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
   (emacs-lisp . t)))


; Calendar syncronization


; some basic commands
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; Agenda


;; Load only existing org directory

(setq agenda-dirs  '("/mnt/c/Users/Quality Assurance/Dropbox/org-agenda/"
                      "~/Dropbox/org-docs/"))
(setq org-agenda-files (delete nil 
         (mapcar (lambda ($x)
                   (if (file-exists-p $x) $x nil)) agenda-dirs)))




(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/Dropbox/org-docs/etiqa-tracker.org" "Tasks")
    "\n** TODO %?
   :PROPERTIES:
   :TYPE: %^{prompt|Other|Bug|CR|Feature|Card}
   :TRACKER: %^{prompt|Other|UHC738-EPO-POS}
   :VERSION: %^{prompt|Other|v19.1.0|v20.0.4|v20.0.5|v20.0.6}
   :END:")))

; Others

(require 'helm-org-rifle)
(require 'org-sticky-header)
(add-hook 'org-mode-hook 'org-sticky-header-mode)

(add-hook 'org-mode-hook 'visual-line-mode)

;; Display emphasis 
(setq org-hide-emphasis-markers t)
;; Better list bullets
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; Better headers

;; (if (boundp 'x-list-fonts)
;;     (let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                                  ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                                  ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                                  ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                                  (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;            (base-font-color     (face-foreground 'default nil 'default))
;;            (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

      ;; (custom-theme-set-faces 'user
      ;;                         `(org-level-8 ((t (,@headline ,@variable-tuple))))
      ;;                         `(org-level-7 ((t (,@headline ,@variable-tuple))))
      ;;                         `(org-level-6 ((t (,@headline ,@variable-tuple))))
      ;;                         `(org-level-5 ((t (,@headline ,@variable-tuple))))
      ;;                         `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
      ;;                         `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
      ;;                         `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
      ;;                         `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.3))))
      ;;                         `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil)))))))



;; Wrap lines

(add-hook 'org-mode-hook 'visual-line-mode)

;; Pitch

;; (custom-theme-set-faces
;;  'user
;;  '(variable-pitch ((t (:family "Source Sans Pro" :height 180 :weight light))))
;;  '(fixed-pitch ((t ( :family "Inconsolata" :slant normal :weight normal :height 1.0 :width normal)))))

;; (add-hook 'org-mode-hook 'variable-pitch-mode)

;; Fonts
;; (custom-theme-set-faces
;;  'user
;;  '(org-block ((t (:inherit fixed-pitch))))
;;  '(org-code ((t (:inherit (shadow fixed-pitch)))))
;;  '(org-document-info ((t (:foreground "dark orange"))))
;;  '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
;;  '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
;;  '(org-link ((t (:foreground "royal blue" :underline t))))
;;  '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;  '(org-property-value ((t (:inherit fixed-pitch))) t)
;;  '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;  '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
;;  '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
;;  '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

;; Icons 
;; Work
;; Icons made by <a href="https://www.flaticon.com/free-icon/work-station_3028249" title="catkuro">catkuro</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
;; Bike
;;Icons made by <a href= "http://www.freepik.com/" title= "Freepik">Freepik</a> from <a href= "https://www.flaticon.com/" title= "Flaticon"> www.flaticon.com</a>

    ;;  ("work" (concat (file-name-directory (buffer-file-name)) "../icons/work-color.svg") nil nil :ascent center)

(customize-set-value
    'org-agenda-category-icon-alist
    `(
        ("work" (all-the-icons-faicon  "cogs") nil nil :ascent center)
      ))
