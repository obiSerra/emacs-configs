;;; setup-racket.el --- Configuration for racket -*- lexical-binding: t -*-

;; Author: Roberto Serra
;; Maintainer: Roberto Serra
;; Version: 1.0.0
;; Package-Requires: (dependencies)
;; Homepage: https://github.com/obiSerra/emacs-configs


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

;; ...

;;; Code:

(add-hook 'racket-mode-hook #'enable-paredit-mode)

(setq racket-racket-program "/usr/local/bin/racket")

(ac-config-default)

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

(add-hook 'racket-mode-hook
          (lambda ()
            (define-key racket-mode-map (kbd "C-c r") 'racket-run)))

(provide 'setup-racket)

;;; setup-racket.el ends here
