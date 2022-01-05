;;; init.el --- configuration for emacs
;; Author: Jun Hashimoto
;;; Code:

;; ==============================================================================
;; load conf under ~/.emacs.d/conf
;; ==============================================================================
(setq load-path (append '("~/.emacs.d/conf") load-path))

(load "autoinsert-init")
(load "general-init")
(load "package-init")
(load "mql-init")
(load "perl-init")
(load "python-init")
(load "ruby-init")
(load "visual-init")

;; if you want custom settings, please write in ~/.emacs.d/conf/custom-init.el
(when (file-exists-p "~/.emacs.d/conf/custom-init.el") (load "custom-init"))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-mode web-mode scss-mode undohist smooth-scroll ruby-end python-mode php-mode objc-font-lock markdown-mode json-mode js2-mode init-loader hlinum hive go-mode fringe-helper elixir-mode coffee-mode auto-complete ac-html-bootstrap))
 '(safe-local-variable-values '((encoding . utf-8) (ruby-mode . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
