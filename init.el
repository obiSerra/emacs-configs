;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
;;(package-initialize)

;; Some combination of GNU TLS and Emacs fail to retrieve archive
;; contents over https.
;; https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/etw48ux
;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341

(if (and (version< emacs-version "26.3") (>= libgnutls-version 30604))
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))


(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)


;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa-stable.milkbox.net/packages/")))

(setq debug-on-error t)
;; Fix for the warnings

(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)

(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit
    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode
;    js2-mode
    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking
    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider
    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous
    ido-vertical-mode
    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex
    ;; project navigation
    projectile
    ;; colorful parenthesis matching
    rainbow-delimiters
    ;; edit html tags like sexps
    tagedit
    ;; git integration
    magit
    git-gutter
    ;; web support
    web-mode
    emmet-mode
    php-mode
    ;; groovy support
    groovy-mode
    ;; various
    auto-complete
    ;; Snippets
    yasnippet
    ;; lsp-mode
    ;; lsp-ui
    ;; company-lsp
    dash
    hide-comnt
    flycheck
    spacemacs-theme
    prettier-js
    dashboard
    rjsx-mode
    helm-org-rifle
    org-sticky-header
    org-bullets
    all-the-icons
    ))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file

(global-auto-revert-mode t)
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/local-plugins/")

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations/")
;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")


;; Generic setup and minor modes enabled
;;
(require 'column-marker)
(require 'user-config)
(load "global.el")
(load "linting.el")
(load "functions.el")
;;(load "lsp-setup.el")
;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-web.el")
(load "setup-racket.el")
(load "setup-ruby.el")
;;(load "setup-groovy.el")

;; Org mode config
(load "setup-org.el")
(load "setup-dashboard.el")
;; Private data and password
(load "private.el" t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   '("a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" default))
 '(ede-project-directories '("/Users/robertoserra/Dropbox/arduino-sketches"))
 '(markdown-command "/usr/local/bin/pandoc")
 '(markdown-preview-http-port 9001)
 '(org-agenda-files
   '("c:/Users/rober/Dropbox/org-agenda/etiqa.org" "c:/Users/rober/Dropbox/org-agenda/js13k.org" "c:/Users/rober/Dropbox/org-agenda/delta.org"))
 '(org-capture-templates
   '(("t" "Todo" entry
      ("FOOO" "~/Dropbox/org-docs/etiqa-tracker.org" "Tracking")
      "* TODO %?
  %?
  %a")) t)
 '(package-selected-packages
   '(neotree doom-themes org-bullets helm-org-rifle org-sticky-header dash ruby-mode flycheck flow-minor-mode markdown-preview-mode websocket spiral yasnippet vue-mode vue-html-mode markdown-mode+ prettier-js scheme-complete scribble-mode geiser quack curl-for-url less sass-mode org-brain geeknote ipython column-marker json-mode handlebars-mode dockerfile-mode js-auto-beautify js2-mode feature-mode less-css-mode kibit-helper gherkin-mode fiplr yaml-mode arduino-mode flymake-jslint ## racket-mode ssh apache-mode php-mode atom-dark-theme spacemacs-theme darkokai-theme groovy-mode ox-twbs plantuml-mode request web-mode org-gcal php+-mode zenburn tagedit smex rainbow-delimiters projectile paredit newlisp-mode monokai-theme material-theme markdown-mode magit jenkins ido-ubiquitous highlight-symbol exec-path-from-shell cyberpunk-theme clojure-mode-extra-font-locking cider ac-emmet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Inconsolata" :slant normal :weight normal :height 1.0 :width normal))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(variable-pitch ((t (:family "Source Sans Pro" :height 180 :weight light)))))
(put 'erase-buffer 'disabled nil)
(put 'upcase-region 'disabled nil)
