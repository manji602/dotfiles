;; ==============================================================================
;; package settings
;; ==============================================================================

;; load packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; refresh packages if needed
;;(package-refresh-contents)

;; install packages for me
(defvar my/install-packages
  '(
    ;; environments
    auto-complete
    ;;flycheck
    fringe-helper
    hlinum
    init-loader
    smooth-scroll
    undohist

    ;; git
    ;;gitconfig-mode
    ;;gitignore-mode

    ;; languages
    ;;; coffeescript
    coffee-mode
    ;;; dockerfile
    dockerfile-mode
    ;;; elixir
    elixir-mode
    ;;; go
    go-mode
    ;;; hive
    hive
    ;;; html
    ac-html-bootstrap
    ;;; javascript
    js2-mode
    ;;; json
    json-mode
    ;;; markdown
    markdown-mode
    ;;markdown-mode+
    ;;; objective-c
    ;;objc-font-lock
    ;;; perl
    perl-mode
    ;;; php
    php-mode
    ;;; python
    python-mode
    ;;; ruby
    ruby-mode
    ruby-end
    ;;ruby-block
    ;;; scss
    scss-mode
    ;;; swift
    ;;swift-mode for > emacs 24.4
    ;;; terraform
    terraform-mode
    ;;; typescript
    typescript-mode
    ;;; web
    web-mode
    ;;; yaml
    yaml-mode
    ))

(dolist (package my/install-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; auto-complete settings
(global-auto-complete-mode t)

;; flycheck settings
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;; web-mode settings
(defun web-mode-indent-hook ()
  "Hooks for Web mode."
  (setq js-indent-level 2)
  (setq web-mode-attr-indent-offset nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq web-mode-script-padding 2)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
)
(add-hook 'web-mode-hook 'web-mode-indent-hook)

;; python-mode settings
(add-hook 'python-mode-hook
  '(lambda ()
     (setq python-indent 4)
     (setq indent-tabs-mod nil)
     (define-key (current-local-map) "\C-h" 'python-backspace)
))

;; js-mode settings
(add-hook 'js-mode-hook
  (lambda ()
  (make-local-variable 'js-indent-level)
  (setq js-indent-level 2)))

;; ts-mode settings
(setq typescript-indent-level 2)

;; css-mode settings
(setq css-indent-offset 2)

;;do not hook rebase-mode
(setq auto-mode-alist (remove (rassoc 'git-rebase-mode auto-mode-alist) auto-mode-alist))
