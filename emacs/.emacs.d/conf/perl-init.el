;; ==============================================================================
;; perl settings
;; ==============================================================================
;;open test file with perl-mode
(setq auto-mode-alist (cons '("\\.t$" . perl-mode) auto-mode-alist))

;;open tmpl file with web-mode
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))

;;highlight over 80 characters on 1 line
(add-hook 'perl-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))
