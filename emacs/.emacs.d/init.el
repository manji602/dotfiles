;;; init.el --- configuration for emacs
;; Author: Jun HASHIMOTO
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;language settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-language-environment "Japanese")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;encode settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(load-theme 'deeper-blue t)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;auto-complete settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-auto-complete-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;flycheck settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;perl settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;open test file with perl-mode
(setq auto-mode-alist (cons '("\\.t$" . perl-mode) auto-mode-alist))
;;highlight over 80 characters on 1 line
(add-hook 'perl-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ruby settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;buffer settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;apply fringe
;;(fringe-mode '(1 . 0))

;;display total line of file
(column-number-mode 1)

;;display line number
(global-linum-mode t)
(setq linum-format "%d ")
(require 'hlinum)

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
;;(global-hl-line-mode t)
;;(set-face-background 'hl-line "grey37")
;;highlight brackets
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

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

;;ignore symbolic confirm dialog
(setq vc-follow-symlinks t)

(provide 'init)
;;; init.el ends here
