;; ==============================================================================
;; visual settings
;; ==============================================================================

;;display total line of file
(column-number-mode 1)

;;display line number
(global-display-line-numbers-mode t)
;;(global-linum-mode t)
(setq linum-format "%d ")
(require 'hlinum)

;;bug fix for ansi color
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
            "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;indent
(setq-default c-basic-offset 4)
(setq-default tab-width 4 indent-tabs-mode nil)

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

;;coloring with grammar
(global-font-lock-mode t)

;;different display style on same name file
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;show clock
(display-time-mode t)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
