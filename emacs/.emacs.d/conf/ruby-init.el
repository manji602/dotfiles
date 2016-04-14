;; ==============================================================================
;; ruby settings
;; ==============================================================================
;;open below files with ruby-mode
(setq auto-mode-alist (cons '("\\.cap$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Vagrantfile$" . ruby-mode) auto-mode-alist))

;;open yml file with yaml-mode
(setq auto-mode-alist (cons '("\\.yml" . yaml-mode) auto-mode-alist))
;;open erb file with html-mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . html-mode))

;;disable magic comment
(setq ruby-insert-encoding-magic-comment nil)

;;highlight over 80 characters on 1 line
(add-hook 'ruby-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

;;flycheck configuration
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))


;;ignore local-variables warning on ruby-mode
(custom-set-variables
 '(safe-local-variable-values (quote ((encoding . utf-8) (ruby-mode . t)))))
(custom-set-faces)
