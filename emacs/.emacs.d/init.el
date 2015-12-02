;;; init.el --- configuration for emacs
;; Author: Jun HASHIMOTO
;;; Code:

;; ==============================================================================
;; load conf under ~/.emacs.d/conf
;; ==============================================================================
(setq load-path (append '("~/.emacs.d/conf") load-path))

(load "general-init")
(load "package-init")
(load "perl-init")
(load "ruby-init")
(load "visual-init")

;; if you want custom settings, please write in ~/.emacs.d/conf/custom-init.el
(if (file-exists-p "~/.emacs.d/conf/custom-init.el")
    (load "custom-init")
  'custom conf file is nil
)

(provide 'init)
;;; init.el ends here
