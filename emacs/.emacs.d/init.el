;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;language settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-language-environment "Japanese")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;encode settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;; refresh packages if needed
;;(package-refresh-contents)

;; install packages for me
(defvar my/install-packages
  '(
    ;; environments
    init-loader
    auto-complete
    ;;; git
    magit git-gutter

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
    ;;; objective-c
    objc-font-lock
    ;;; perl
    perl-mode
    ;;; php
    php-mode
    ;;; ruby
    ruby-mode
    ;;; swift
    ;;swift-mode for > emacs 24.4
    ))

(dolist (package my/install-packages)
  (unless (package-installed-p package)
    (package-install package)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;buffer settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;display total line of file
(column-number-mode 1)
;;completion without large capital
(setq completion-ignore-case t)
;;bug fix for ansi color
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
            "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;indent
(setq-default c-basic-offset 4)
(setq-default tab-width 4 indent-tabs-mode nil)
;;different display style on same name file
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;;highlight on current line
(defface hlline-face
    '((((class color)
              (background dark))
            (:background "#FFc0CB"))
          (((class color)
                  (background light))
                (:background  "#FFC0CB"))
              (t
                    ()))
      "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)
;;show tab, zenkaku-space, white spaces at end of line
(defface my-face-tab         '((t (:background "Yellow"))) nil :group 'my-faces)
(defface my-face-zenkaku-spc '((t (:background "LightBlue"))) nil :group 'my-faces)
(defface my-face-spc-at-eol  '((t (:foreground "Red" :underline t))) nil :group 'my-faces)
(defface my-face-and         '((t (:foreground "Red" :underline t))) nil :group 'my-faces)
(defvar my-face-tab         'my-face-tab)
(defvar my-face-zenkaku-spc 'my-face-zenkaku-spc)
(defvar my-face-spc-at-eol  'my-face-spc-at-eol)
(defvar my-face-and         'my-face-and)
(defadvice font-lock-mode (before my-font-lock-mode ())
    (font-lock-add-keywords
        major-mode
           '(("\t" 0 my-face-tab append)
                  ("ÂÂ" 0 my-face-zenkaku-spc append)
                      ("[ \t]+$" 0 my-face-spc-at-eol append)
                          ("&" 0 my-face-and append)
                               )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
;;not make backupfiles
(setq backup-inhibited t)
;;coloring with grammar
(global-font-lock-mode t)
;;show clock
(display-time-mode t)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
