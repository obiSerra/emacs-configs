(require 'web-mode)
;; (require 'js-auto-beautify)


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

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(add-hook 'js2-mode-hook (lambda ()
  (web-mode-set-content-type "jsx")))

;; delete trailing whitespace in js
(add-hook 'js2-mode-hook
          (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(add-hook 'web-mode-hook 'paredit-mode)

;; (add-hook 'web-mode-hook 'js-auto-beautify-mode)
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;;; PHP-mode installed manually because package-install didn't work

(eval-after-load 'php-mode
  '(require 'php-ext))

;; JS config

(setq js-indent-level 4)
(setq js-switch-indent-offset 4)


(add-hook 'js2-mode-hook (lambda () (interactive) (column-marker-1 120)))
