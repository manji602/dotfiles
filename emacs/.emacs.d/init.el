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
;;default tab->white spaces*4
(setq-default tab-width 4 indent-tabs-mode nil)
;;not make backupfiles
(setq backup-inhibited t)
;;coloring with grammar
(global-font-lock-mode t)
;;show clock
(display-time-mode t)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;path settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;load-path
(add-to-list 'load-path "~/site-lisp/")
(defvar user-emacs-directory "~/.emacs.d/")
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	        (normal-top-level-add-subdirs-to-load-path))))))

;;(add-to-load-path "elisp" "conf" "public_repos" "site-lisp")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;perl settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;open module by focasing module namespace with M-.
(defun  perl-find-module ()
    (interactive)
      (let
                (end begin module path-to-module)
            (save-excursion
                    (setq begin (save-excursion (skip-chars-backward "a-zA-Z0-9_:") (point)))
                          (setq end (save-excursion (skip-chars-forward "a-zA-Z0-9_:") (point)))
                                (setq module (buffer-substring begin end)))
                (shell-command (concat "perldoc -lm " module) "*perldoc*")
                    (save-window-excursion
                            (switch-to-buffer "*perldoc*")
                                  (setq end (point))
                                        (setq begin (save-excursion (beginning-of-line) (point)))
                                              (setq path-to-module (buffer-substring begin end)))
                        (message path-to-module)
                            (find-file path-to-module)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;octave settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'octave-mode "octave-mod" nil t)
(setq-default octave-block-offset 4)
(setq auto-mode-alist
           (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
               (lambda ()
                 (abbrev-mode 1)
                 (auto-fill-mode 1)
                 (if (eq window-system 'x)
                     (font-lock-mode 1))))
