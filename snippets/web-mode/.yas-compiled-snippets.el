;;; Compiled snippets and support files for `web-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'web-mode
                     '(("script.javascript-src" "<script type=\"text/javascript\" src=\"$1\"></script>" "<script type=\"text/javascript\" src=\"...\"></script>" nil nil nil "/Users/rserra/.emacs.d/snippets/web-mode/script.javascript-src" nil nil)
                       ("script.javascript" "<script type=\"text/javascript\">\n  $0\n</script>" "<script type=\"text/javascript\">...</script>" nil nil nil "/Users/rserra/.emacs.d/snippets/web-mode/script.javascript" nil nil)
                       ("meta.http-equiv" "<meta http-equiv=\"${1:Content-Type}\" content=\"${2:text/html; charset=UTF-8}\" />" "<meta http-equiv=\"...\" content=\"...\" />" nil
                        ("meta")
                        nil "/Users/rserra/.emacs.d/snippets/web-mode/meta.http-equiv" nil nil)
                       ("meta" "<meta name=\"${1:generator}\" content=\"${2:content}\" />" "<meta name=\"...\" content=\"...\" />" nil
                        ("meta")
                        nil "/Users/rserra/.emacs.d/snippets/web-mode/meta" nil nil)
                       ("html-doc" "<!DOCTYPE html>\n<html>\n  <head>\n    <title>${1:Page Title}</title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"keywords\" content=\"${2:...}\">\n    <meta name=\"description\" content=\"${3:...}\">\n  </head>\n  <body>\n   $0\n  </body>\n</html>\n" "Html document" nil nil nil "/Users/rserra/.emacs.d/snippets/web-mode/html-doc" nil nil)))


;;; Do not edit! File generated at Thu Apr 11 13:10:10 2019
