
(setq column-number-mode t)

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

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
	     '("\\.txt" . markdown-mode))
(add-to-list 'auto-mode-alist
	     '("\\.md" . markdown-mode))


; Enable auto-fill mode when editing Markdown.
(add-hook 'markdown-mode-hook 'auto-fill-mode)


;;
;; Javascript
;;

(add-to-list 'auto-mode-alist
	     '("\\.js\\'" . espresso-mode))
(autoload 'espresso-mode "espresso" 
  "Major mode for editing Javascript files" t)
(setq espresso-mode-hook
      (function (lambda ()
		  (setq indent-tabs-mode nil)
		  (setq espresso-indent-level 2)
		  )
		))


;;
;; CSS
;;

(add-to-list 'auto-mode-alist
	     '("\\.css\\'" . css-mode))
(autoload 'css-mode "css-mode"
  "Major mode for editing CSS files" t)

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
(autoload 'haskell-cabal-mode "haskell-site-file.el"
  "Major mode for editing Cabal files" t)
(add-to-list 'auto-mode-alist
	     '("\\.hs" . haskell-mode))
(add-to-list 'auto-mode-alist
	     '("\\.lhs" . haskell-mode))
(add-to-list 'auto-mode-alist
	     '("\\.cabal" . haskell-cabal-mode))


; Enable automatic documentation display
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
; Enable intelligent indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-cabal-mode-hook
	  (lambda () (setq indent-tabs-mode nil))
	  )

;;
;; DVC
;;

(require 'dvc-autoloads)


;;
;; PHP Mode
;;

(autoload 'php-mode "php-mode.el"
  "Major mode for editing PHP files" t)

(autoload 'drupal-mode "drupal-mode.el"
  "Major mode for editing Drupal PHP files" t)

(add-to-list 'auto-mode-alist
	     '("\\.\\(module\\|test\\|install\\|theme\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist
	     '("\\.\\(php\\|inc\\)$" . php-mode))
(add-to-list 'auto-mode-alist
	     '("\\.info" . conf-windows-mode))

;;
;; Javascript Mode
;;

(autoload 'js2-mode "js2"
  "Major mode for editing Javascript" t)
(add-to-list 'auto-mode-alist
	     '("\\.js$" . js2-mode))

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
;; Nginx
;;

(autoload 'nginx-mode "nginx-mode.el"
  "Major mode for editing nginx configuration files")
(add-to-list 'auto-mode-alist
  '("nginx/" . nginx-mode))


;;
;; YAML
;;

(autoload 'yaml-mode "yaml-mode.el"
  "Major mode for editing YAML files")
(add-to-list 'auto-mode-alist
  '("\\.yml$" . yaml-mode))

;;
;; Org mode
;;
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; ;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; ;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; ;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-agenda-files (list "~/org/work.org"
			     "~/org/school.org"
                             "~/org/home.org"))


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(require-final-newline t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "apple" :family "Monaco")))))
