;;; global.el --- Global configuration -*- lexical-binding: t -*-

;; Author: Roberto
;; Maintainer: Roberto
;; Version: 1.0.0
;; Package-Requires: (yasnippet)


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:

(require 'hideshow)
(require 'hide-comnt)

(add-hook 'prog-mode-hook #'hs-minor-mode)
(setq hs-hide-comments-when-hiding-all t)
(setq hs-hide-initial-comment-block t)

(defun copy-from-osx ()
  "Mac osx Emacs interaction."
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

;; Interactions between emacs kill-ring and mac osx clipboard
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; Git gutter abled

(global-git-gutter-mode +1)

(yas-global-mode 1)

(provide 'global)

;;; global.el ends here
