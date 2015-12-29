;; ==============================================================================
;; package settings
;; ==============================================================================

;; load packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
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
    gitconfig-mode
    gitignore-mode

    ;; languages
    ;;; coffeescript
    coffee-mode
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
    markdown-mode+
    ;;; objective-c
    objc-font-lock
    ;;; perl
    perl-mode
    ;;; php
    php-mode
    ;;; python
    python-mode
    ;;; ruby
    ruby-mode
    ruby-end
    ruby-block
    ;;; scss
    scss-mode
    ;;; swift
    ;;swift-mode for > emacs 24.4
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
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset   2))
(add-hook 'web-mode-hook 'web-mode-hook)

;; python-mode settings
(add-hook 'python-mode-hook
  '(lambda ()
     (setq python-indent 4)
     (setq indent-tabs-mod nil)
     (define-key (current-local-map) "\C-h" 'python-backspace)
))
