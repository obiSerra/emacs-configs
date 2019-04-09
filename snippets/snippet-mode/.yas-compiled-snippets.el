;;; Compiled snippets and support files for `snippet-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'snippet-mode
                     '(("vars" "# name: $1${2:\n# key: ${3:trigger-key}}${4:\n# keybinding : ${5:keybinding}}${6:\n# expand-env : (${7:})}\n# contributor : $6\n# key: vars\n# --\n$0" "Snippet header" nil nil nil "/Users/rserra/.emacs.d/snippets/snippet-mode/vars" nil nil)
                       ("mirror" "\\${${2:n}:${4:\\$(${5:reflection-fn})}\\}$0" "${n:$(...)} mirror" nil nil nil "/Users/rserra/.emacs.d/snippets/snippet-mode/mirror" nil nil)
                       ("header" "# name: $1\n# contributor: ${2:`user-full-name` <`user-mail-address`>}\n# key: $3\n# --\n\n$0" "Snippet Header" nil nil nil "/Users/rserra/.emacs.d/snippets/snippet-mode/header" nil nil)
                       ("group" "# group : ${1:group}" "group" nil nil nil "/Users/rserra/.emacs.d/snippets/snippet-mode/group" nil nil)
                       ("field" "\\${${1:${2:n}:}$3${4:\\$(${5:lisp-fn})}\\}$0" "${ ...  } field" nil nil nil "/Users/rserra/.emacs.d/snippets/snippet-mode/field" nil nil)
                       ("`" "\\`$0\\`" "elisp" nil nil nil "/Users/rserra/.emacs.d/snippets/snippet-mode/elisp" nil nil)))


;;; Do not edit! File generated at Tue Apr  9 16:41:22 2019
