;;; WHEN get back to the starting char, count the chars added/removed


(defun cy-skip-all ()
  (interactive)

  (let (cursor-original-position (point))
    (goto-char (point-min))
    (while (re-search-forward "^\\([[:blank:]]*it\\)(" nil t)
      (replace-match "\\1.skip("))
    (goto-char cursor-original-position)))

(defun cy-unskip-all ()
  (interactive)
  (let (cursor-original-position (point))
    (goto-char (point-min))
    (while (re-search-forward "^\\([[:blank:]]*it\\)\.skip" nil t)
      (replace-match "\\1"))
    (goto-char cursor-original-position)))

(defun cy-skip-current ()
  (interactive)
  (let (cursor-original-position (point))
    (re-search-backward "^\\([[:blank:]]*it\\)" nil t)
    (replace-match "\\1.skip")
    (goto-char cursor-original-position)))


(defun cy-unskip-current ()
  (interactive)
  (let (cursor-original-position (point))
       (re-search-backward "^\\([[:blank:]]*it\\)\.skip" nil t)
       (replace-match "\\1")
       (goto-char (+ 5 cursor-original-position))))
