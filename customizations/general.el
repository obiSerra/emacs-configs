;; Hide Show mode enable

(add-hook 'prog-mode-hook #'hs-minor-mode)

(defun copy-from-osx ()
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
