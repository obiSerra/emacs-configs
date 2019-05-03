;;; setup-web.el --- Setup for web developing (JS, JSX, PHP, HTML...)
;;; Commentary:

;; Default mode for JS and JSX is rjsx
;; For other file type is web-mode

;;; Code:

;; Major mode configuration

;;; setup-web.el --- Setup for web develooment -*- lexical-binding: t -*-

;; Author: Roberto Serra
;; Maintainer: Roberto Serra
;; Version: 1.0.0
;; Package-Requires: (dependencies)
;; Homepage: https://github.com/obiSerra/emacs-configs


;;; Commentary:

;; ...

;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.html\\'" . web-mode))

(setq web-mode-enable-current-element-highlight t)

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))

;; delete trailing whitespace in js

(add-hook 'rjsx-mode-hook
          (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;; (add-hook 'web-mode-hook 'paredit-mode)

;; (add-hook 'web-mode-hook 'js-auto-beautify-mode)

;; emmet mode

(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'vue-mode-hook 'emmet-mode)
(add-hook 'rjsx-mode-hook 'emmet-mode)

;;; PHP-mode installed manually because package-install didn't work

(eval-after-load 'php-mode
  '(require 'php-ext))

(setq js-indent-level 2)
(setq js-switch-indent-offset 2)

(require 'prettier-js)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'vue-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)

;; (add-hook 'js2-mode-hook 'flow-minor-mode)
;; (add-hook 'rjsx-mode-hook 'flow-minor-mode)

(require 'column-marker)

(add-hook 'rjsx-mode-hook (lambda () (interactive) (column-marker-1 120)))


(add-to-list 'load-path "~/tools/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'rjsx-mode-hook 'tern-mode)


(add-hook 'rjsx-mode-hook 'auto-complete-mode)

(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))


(require 'hideshow)
(add-hook 'rjsx-mode-hook (lambda () (hs-hide-all)))

(provide 'setup-web)

;;; setup-web.el ends here
