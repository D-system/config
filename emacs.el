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

;; SCSS mode
(load "~/config/submodules/scss-mode/scss-mode.el")
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
;; SCSS mode: no auto-compilation at save
(setq scss-compile-at-save nil)


;; php mode
(load "~/config/submodules/php-mode/php-mode.el")
(autoload 'php-mode "php-mode")
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

;; ruby mode
(load "~/config/emacs-mode/ruby-mode.el")
(autoload 'ruby-mode "ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; emmet mode (html/css shorcut)
(load "~/config/submodules/emmet-mode/emmet-mode.el")

(load "~/config/submodules/yaml-mode/yaml-mode.el")
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(load "~/config/submodules/emacs-git-gutter/git-gutter.el")
(global-git-gutter-mode +1)
(custom-set-variables
 '(git-gutter:update-interval 1))
(set-face-background 'git-gutter:modified "purple")
(set-face-background 'git-gutter:added "green")
(set-face-background 'git-gutter:deleted "red")
(set-face-foreground 'git-gutter:modified "white")
(set-face-foreground 'git-gutter:added "white")
(set-face-foreground 'git-gutter:deleted "white")

;; (custom-set-variables
;;  '(git-gutter:unchanged-sign " "))
;; (set-face-background 'git-gutter:unchanged "gray")
