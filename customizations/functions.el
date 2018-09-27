;; ((lambda (s) (let ((case-fold-search nil)) (while (string-match "[A-Z]" s 1) (setq s (replace-match (concat "-" (downcase (match-string 0 s))) t nil s))) (downcase s))) yas-text)

(defun camelCase->snake-case (s &optional sep start)
  "Convert CamelCase string S to lower case with word separator SEP.
   Default for SEP is a hyphen \"-\"."
  (interactive)
  (let ((case-fold-search nil))
    (while (string-match "[A-Z]" s (or start 1))
      (setq s (replace-match (concat (or sep "-")
                                     (downcase (match-string 0 s)))
                             t nil s)))
    (downcase s)))


(defun camelCase->words (s &optional sep start) 
  (interactive)
  (replace-regexp-in-string (or sep "-") " " (un-camelcase-string s (or sep "-") (or start 1))))
