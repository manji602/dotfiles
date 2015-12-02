;; ==============================================================================
;; general settings
;; ==============================================================================

;; language
(set-language-environment "Japanese")

;; encode
(setq buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)

;;completion without large capital
(setq completion-ignore-case t)

;;not make backupfiles
(setq backup-inhibited t)

;;ignore symbolic confirm dialog
(setq vc-follow-symlinks t)
