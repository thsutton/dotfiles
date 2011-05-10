

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

(put 'upcase-region 'disabled nil)

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
;; Ruby
;;
(autoload 'ruby-mode "ruby-mode"
  "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist
	     '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist
	     '("ruby" . ruby-mode))

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process.")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
	     (inf-ruby-keys)
	     ))

;;
;; Haskell
;;

(autoload 'haskell-mode "haskell-site-file.el"
  "Major mode for editing Haskell files" t)
(add-to-list 'auto-mode-alist
	     '("\\.hs" . haskell-mode))

; Enable automatic documentation display
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
; Enable intelligent indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;;
;; DVC
;;

(require 'dvc-autoloads)


;;
;; PHP Mode
;;

(autoload 'php-mode "php-mode-improved.el"
  "Major mode for editing PHP files" t)
(add-to-list 'auto-mode-alist
	     '("\\.php" . php-mode))


;;
;; CSV Mode
;;

(autoload 'csv-mode "csv-mode.el"
  "Major mode for editing CSV files" t)
(add-to-list 'auto-mode-alist
    '("\\.csv" . csv-mode))


;;
;; Puppet
;;

(autoload 'puppet-mode "puppet-mode"
  "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist 
    '("\\.pp$" . puppet-mode))


;;
;; Org mode
;;
;; (require 'org-install)
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done t)
;; ;; Set to the location of your Org files on your local system
;; (setq org-directory "~/org")
;; ;; Set to the name of the file where new notes will be stored
;; (setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; ;; Set to <your Dropbox root directory>/MobileOrg.
;; (setq org-mobile-directory "~/Dropbox/MobileOrg")
;; (setq org-agenda-files (list "~/org/index.org"
;;                              "~/org/work.org"
;;                              "~/org/home.org"))
