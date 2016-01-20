;; ==============================================================================
;; autoinsert settings
;; ==============================================================================
(require 'autoinsert)

(setq auto-insert-directory "~/.emacs.d/autoinsert/templates")

(defvar template-list
  '(
    ("%directory%" . (lambda () (file-name-directory (buffer-file-name))))
    ("%year%" . (lambda () (format-time-string "%Y" (current-time))))
    ("%author%" . (lambda () "Jun Hashimoto"))
    )
)

(defun autoinsert-template ()
  (mapc #'(lambda(c)
        (progn
          (goto-char (point-min))
          (replace-string (car c) (funcall (cdr c)) nil)))
    template-list)
  (goto-char (point-max))
  (message "done."))

;; NOTE:
;; default template of LICENSE.txt is MIT
(setq auto-insert-alist
      (nconc '(
               ("README.md$" . ["README.md" autoinsert-template])
               ("LICENSE.txt$" . ["LICENSE.txt" autoinsert-template])
               (".pm$" . ["perl-module.pm"])
               ) auto-insert-alist))
(require 'cl)

(add-hook 'find-file-not-found-hooks 'auto-insert)
(setq auto-insert-query nil)
