(require 'autoinsert)

(setq auto-insert-directory "~/.emacs.d/autoinsert/templates")

(setq auto-insert-alist
      (nconc '(
               ("README.md$" . ["README.md"])
               ("LICENSE.txt$" . ["LICENSE.txt"])
               ) auto-insert-alist))
(require 'cl)

(add-hook 'find-file-not-found-hooks 'auto-insert)
