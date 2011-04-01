

;;
;; Add local lisp and info directories
;;
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'Info-default-directory-list "~/.emacs.d/info/")


;; Key bindings
(global-set-key (kbd "C-x a r") 'align-regexp)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(transient-mark-mode 1)


;;
;; Markdown
;;
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.txt" . markdown-mode) auto-mode-alist))

; Enable auto-fill mode when editing Markdown.
(add-hook 'markdown-mode-hook 'auto-fill-mode)


;;
;; Haskell
;;
(autoload 'haskell-mode "haskell-site-file.el"
  "Major mode for editing Haskell files" t)
(setq auto-mode-alist
      (cons '("\\.hs" . haskell-mode) auto-mode-alist))

; Enable automatic documentation display
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
; Enable intelligent indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;;
;; DVC
;;

(require 'dvc-autoloads)


;;
;; Org mode
;;
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-agenda-files (list "~/org/index.org"
                             "~/org/work.org" 
                             "~/org/home.org"))
