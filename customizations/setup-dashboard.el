;;; setup-dashboard.el --- Dashboard setup -*- lexical-binding: t -*-

;; Author: Roberto Serra
;; Maintainer: Roberto Serra
;; Version: 1.0.0
;; Package-Requires: (dashboard)
;; Homepage: https://github.com/obiSerra/emacs-configs



;;; Commentary:


;;; Code:

(require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-banner-logo-title "Welcome back OH GREAT OBI!")
(setq dashboard-startup-banner 'logo)

;;(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; Widgets
(setq dashboard-items '((agenda . 10)
                        (recents  . 10)
                        (projects . 5)
                        (bookmarks . 5)
                        (registers . 5)))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

(provide 'setup-dashboard)

;;; setup-dashboard.el ends here
