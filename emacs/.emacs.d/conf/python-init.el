;; ==============================================================================
;; python settings
;; ==============================================================================
;;open below files with python-mode
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
