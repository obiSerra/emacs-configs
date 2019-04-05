;;; package --- Summary
;;; Commentary:
;;; setup-web --- configuration

;;; Code:

(require 'web-mode)
;; (require 'column-marker)


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

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))

;; (add-hook 'js2-mode-hook (lambda ()
  ;; (web-mode-set-content-type "jsx")))

(add-hook 'web-mode-hook
      (lambda ()
        ;; short circuit js mode and just do everything in jsx-mode
        (if (equal web-mode-content-type "javascript")
            (web-mode-set-content-type "jsx")
          (message "now set to: %s" web-mode-content-type))))

;; delete trailing whitespace in js
(add-hook 'js2-mode-hook
          (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;; (add-hook 'web-mode-hook 'paredit-mode)

;; (add-hook 'web-mode-hook 'js-auto-beautify-mode)
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'js2-mode-hook 'emmet-mode)
(add-hook 'vue-mode-hook 'emmet-mode)
(add-hook 'rjsx-mode-hook 'emmet-mode)

;;; PHP-mode installed manually because package-install didn't work

(eval-after-load 'php-mode
  '(require 'php-ext))

;; JS config

;; UHC STYLE
;; (setq js-indent-level 4)
;; (setq js-switch-indent-offset 4)

;; PSK STYLE
(setq js-indent-level 2)
(setq js-switch-indent-offset 2)


;; (setq web-mode-markup-indent-offset 4)
;; (setq web-mode-css-indent-offset 4)
;; (setq web-mode-code-indent-offset 4)
;; (setq web-mode-indent-style 4)

(setq js2-strict-missing-semi-warning nil)



(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'vue-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode 'prettier-js-mode)


(add-hook 'web-mode-hook #'(lambda ()
                            (enable-minor-mode
                             '("\\.jsx?\\'" . prettier-js-mode))))



;;
;; (add-hook 'html-mode-hook
          ;; (lambda ()
  ;;             ;; Default indentation is usually 2 spaces, changing to 4.
  ;;            (set (make-local-variable 'sgml-basic-offset) 4)
            ;; ))

;; (add-hook 'js2-mode-hook
          ;; (lambda ()
;;            ;; Default indentation is usually 2 spaces, changing to 4.
            ;; (set (make-local-variable 'sgml-basic-offset) 4)))


;; (setq-default indent-tabs-mode nil)
 ;; (setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)


;; (add-hook 'js2-mode-hook 'flow-minor-mode)
;; (add-hook 'rjsx-mode-hook 'flow-minor-mode)

(add-hook 'js2-jsx-mode-hook (lambda () (interactive) (column-marker-1 120)))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; (add-hook 'rjsx-mode-hook 'flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))


;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
