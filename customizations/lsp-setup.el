(require 'lsp-mode)
;; (require 'lsp-clients)
(add-hook 'prog-mode-hook #'lsp)


;; (require 'lsp-ui)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)


(require 'company-lsp)
(push 'company-lsp company-backends)
