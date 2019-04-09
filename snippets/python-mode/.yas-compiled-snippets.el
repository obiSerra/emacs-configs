;;; Compiled snippets and support files for `python-mode'
;;; contents of the .yas-setup.el support file:
;;;
(require 'yasnippet)
(defvar yas-text)

(defun python-split-args (arg-string)
  "Split a python argument string into ((name, default)..) tuples"
  (mapcar (lambda (x)
             (split-string x "[[:blank:]]*=[[:blank:]]*" t))
          (split-string arg-string "[[:blank:]]*,[[:blank:]]*" t)))

(defun python-args-to-docstring ()
  "return docstring format for the python arguments in yas-text"
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args yas-text))
         (max-len (if args (apply 'max (mapcar (lambda (x) (length (nth 0 x))) args)) 0))
         (formatted-args (mapconcat
                (lambda (x)
                   (concat (nth 0 x) (make-string (- max-len (length (nth 0 x))) ? ) " -- "
                           (if (nth 1 x) (concat "\(default " (nth 1 x) "\)"))))
                args
                indent)))
    (unless (string= formatted-args "")
      (mapconcat 'identity (list "Keyword Arguments:" formatted-args) indent))))

(defun python-args-to-docstring-numpy ()
  "return docstring format for the python arguments in yas-text"
  (let* ((args (python-split-args yas-text))
         (format-arg (lambda(arg)
                       (concat (nth 0 arg) " : " (if (nth 1 arg) ", optional") "\n")))
         (formatted-params (mapconcat format-arg args "\n"))
         (formatted-ret (mapconcat format-arg (list (list "out")) "\n")))
    (unless (string= formatted-params "")
      (mapconcat 'identity
                 (list "\nParameters\n----------" formatted-params
                       "\nReturns\n-------" formatted-ret)
                 "\n"))))


(add-hook 'python-mode-hook
          '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
                     '(("script" "#!/usr/bin/env python3\n\nimport optparse\n\ndef main():\n    pass\n\nif __name__ == '__main__':\n    main()\n" "Script file" nil nil nil "/Users/rserra/.emacs.d/snippets/python-mode/script" nil nil)
                       ("opt-parse" "parser = optparse.OptionParser('usage%prog -${1:f} <${2:hosts list}>')\nparser.add_option('-f', dest='${3:vname}', type='string', help='...')\n(options, args) = parser.parse_args()\n\nvname = options.$3\n\nif $3 == None:\n   print(parser.usage)\n   exit(0)" "Optparse" nil nil nil "/Users/rserra/.emacs.d/snippets/python-mode/opt-parse" nil nil)
                       ("#!" "#!/usr/bin/env python3" "Shebang" nil nil nil "/Users/rserra/.emacs.d/snippets/python-mode/bang" nil nil)))


;;; Do not edit! File generated at Tue Apr  9 16:41:22 2019
