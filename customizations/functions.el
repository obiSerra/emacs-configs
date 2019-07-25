;; ((lambda (s) (let ((case-fold-search nil)) (while (string-match "[A-Z]" s 1) (setq s (replace-match (concat "-" (downcase (match-string 0 s))) t nil s))) (downcase s))) yas-text)


(defun camelCase->snake-case (s &optional sep start)
  "Convert CamelCase string S to lower case with word separator SEP.
   Default for SEP is a hyphen \"-\"."
  (interactive)
  (catch 'empty-string
    (or (> (length s) 0)
        (throw 'empty-string ""))
    (let ((case-fold-search nil))
      (while (string-match "[A-Z]" s (or start 1))
        (setq s (replace-match (concat (or sep "-")
                                       (downcase (match-string 0 s)))
                               t nil s)))
      (downcase s))))

(defun region-camelCase->snake-case ()
  "Convert from camelCase to snake-case the current selected region"
  (interactive)
  (setq new-content(camelCase->snake-case (buffer-substring (region-beginning) (region-end))))
  (delete-region (region-beginning) (region-end))
  (insert new-content))

;; (defun camelCase->words (s &optional sep start)
  ;; (interactive)
  ;; (replace-regexp-in-string (or sep "-") " " (un-camelcase-string s (or sep "-") (or start 1))))


(defun react-stateless->react-class ()
  "Convert a React stateless component into a React class component"
  (interactive)
  (setq content (buffer-substring (region-beginning) (region-end)))
  (setq with-props "class \\1 extends Component {\n render(){\n const \\2 = this.props \nreturn")
  (setq without-props "class \\1 extends Component {\n render(){ \nreturn")
  (setq class-content
        (concat
         (replace-regexp-in-string "const \\(.*\\) = (\\(.*\\)) =>" (if (string-match "(.+)" content) with-props without-props) content)
         "\n}\n}"))
  (delete-region (region-beginning) (region-end))
  (insert class-content))


(load "cypress-functions.el")
