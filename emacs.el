;;;; notes : nil = false, t = true

;; UTF8
(set-language-environment "UTF-8")
; for accents (^ + letter)
(load-library "iso-transl")


;; Display number of the colunm
(column-number-mode t)
;; Do not fold lines which are too long for the window
;(setq truncate-partial-width-windows nil)
;; Disable emacs opening message
(setq inhibit-startup-message t)

;; yes/no --> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight current line
;(global-hl-line-mode 1)

;; Show corresponding parenthesis
(show-paren-mode)

;; no backups
;(setq make-backup-files nil)
;; change backup dir
(defvar backup-dir "~/config/emacsbackups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
;; change autosave dir
(setq auto-save-file-name-transforms
      `((".*" ,backup-dir t)))


;; Add color to a shell running in emacs 'M-x shell'
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
