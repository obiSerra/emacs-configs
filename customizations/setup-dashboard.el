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

;; Widgets
(setq dashboard-items '((agenda . 5)
                        (recents  . 5)
                        (projects . 5)
                        (bookmarks . 5)
                        (registers . 5)))


(provide 'setup-dashboard)

;;; setup-dashboard.el ends here
