;;; Compiled snippets and support files for `emacs-lisp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'emacs-lisp-mode
                     '(("header" ";;; ${1:name}.el --- ${2:summary} -*- lexical-binding: t -*-\n\n;; Author: ${3:`(user-full-name) - (user-mail-address)`}\n;; Maintainer: ${4:`(user-full-name) - (user-mail-address)`}\n;; Version: ${5:1.0.0}\n;; Package-Requires: (${6:dependencies})\n;; Homepage: ${7:https://github.com/obiSerra/emacs-configs}\n\n${9:\n;; This file is not part of GNU Emacs\n\n;; This file is free software; you can redistribute it and/or modify\n;; it under the terms of the GNU General Public License as published by\n;; the Free Software Foundation; either version 3, or (at your option)\n;; any later version.\n\n;; This program is distributed in the hope that it will be useful,\n;; but WITHOUT ANY WARRANTY; without even the implied warranty of\n;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n;; GNU General Public License for more details.\n\n;; For a full copy of the GNU General Public License\n;; see <http://www.gnu.org/licenses/>.\n}\n\n;;; Commentary:\n\n;; ${10:commentary}\n\n;;; Code:\n\n${11:(message \"Hello World!\")}\n\n(provide '$1)\n\n;;; $1.el ends here" "package header" nil nil nil "/Users/rserra/.emacs.d/snippets/emacs-lisp-mode/header" nil nil)))


;;; Do not edit! File generated at Tue Apr  9 16:41:22 2019
