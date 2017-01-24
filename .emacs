;;
;; Package management
;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;;
;; Add local lisp and info directories
;;

(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'Info-default-directory-list "~/.emacs.d/info/")

(setenv "DICPATH"
  (concat (getenv "HOME") "/Library/Spelling"))

(setenv "PATH"
  (concat "/usr/local/ghc-7.8.4/bin:" (getenv "PATH")))

(setq exec-path
  (append '("/usr/local/ghc-7.8.4/bin") exec-path))

;;
;; Customise UI and UX
;;

(setq initial-scratch-message "")
(setq initial-major-mode 'text-mode)

(setq indent-tabs-mode nil)
(setq inhibit-startup-buffer-menu t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(tool-bar-mode -1)

;; Input and encodings
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; line and column numbers
(global-linum-mode t)
(setq line-number-mode t)
(setq column-number-mode t)

;; smooth scrolling
(require-package 'smooth-scrolling)
(require 'smooth-scrolling)


;; Whitespace
;
; Highlight whitespace in inappropriate places.
(setq whitespace-style '(face trailing lines-tail tabs))
(global-whitespace-mode 1)

(transient-mark-mode 1)

;; Key bindings
(global-set-key (kbd "C-x a r") 'align-regexp)

(require-package 'pretty-mode)
(require 'pretty-mode)

;;
;; Markdown
;;

(require-package 'markdown-mode)
(require-package 'pandoc-mode)

(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'markdown-mode-hook 'auto-fill-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))

;;
;; Haskell
;;

(require-package 'haskell-mode)
(require-package 'ghc)
(require 'haskell-interactive-mode)
(require 'haskell-process)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
(add-hook 'haskell-mode-hook 'flyspell-mode)

(define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
(define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)

(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)

(add-hook 'align-load-hook
  (lambda ()
    (add-to-list 'align-rules-list
                 '(haskell-types
                   (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
                   (modes quote (haskell-mode literate-haskell-mode))))
    (add-to-list 'align-rules-list
                 '(haskell-assignment
                   (regexp . "\\(\\s-+\\)=\\s-+")
                   (modes quote (haskell-mode literate-haskell-mode))))
    (add-to-list 'align-rules-list
                 '(haskell-arrows
                   (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                   (modes quote (haskell-mode literate-haskell-mode))))
    (add-to-list 'align-rules-list
                 '(haskell-left-arrows
                   (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
                   (modes quote (haskell-mode literate-haskell-mode))))
    ))

;;
;; Scala
;;

(require-package 'scala-mode2)
(require-package 'sbt-mode)
;(require-package 'ensime)
;(require 'ensime)
;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'scala-mode-hook #'yas-minor-mode)
; but company-mode / yasnippet conflict.
;(define-key company-active-map [tab] nil)

(require-package 'thrift)

;;
;; Idris
;;

(require-package 'idris-mode)

;;
;; SML
;;

(require-package 'sml-mode)

;;
;; JonPRL
;;

(require-package 'jonprl-mode)
(require 'jonprl-mode)

(pretty-add-keywords
  'jonprl-mode
  '(("\\\[" . "⸤")
    ("\\\]" . "⸥")
    ("<" . "⟨")
    (">" . "⟩")
    ("<>" . "⬧")
    ("\\<\\(=def=\\)\\>" . "≝")
    ))

;;
;; Twelf support
;;
(if (file-exists-p "~/Applications/Twelf")
    (progn
      (setq twelf-root "~/Applications/Twelf/")
      (load (concat twelf-root "emacs/twelf-init.el"))))

;;
;; CSV Mode
;;

(require-package 'csv-mode)

;;
;; Graphviz
;;

(require-package 'graphviz-dot-mode)

;;
;; Puppet
;;

(require-package 'puppet-mode)

;;
;; Nginx
;;

(require-package 'nginx-mode)

;;
;; YAML
;;

(require-package 'yaml-mode)

;;
;; Python
;;

(add-hook 'python-mode-hook
  (lambda ()
    (setq tab-width 4)))

;;
;; Lua
;;

(require-package 'lua-mode)

;;
;; Ruby
;;

(add-hook 'ruby-mode-hook
  (lambda ()
    (setq tab-width 4)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("." "/usr/local/lib/agda/src")))
 '(haskell-font-lock-symbols t)
 '(haskell-indent-spaces 4)
 '(haskell-mode-hook
   (quote
    (flyspell-prog-mode flyspell-mode haskell-auto-insert-module-template interactive-haskell-mode)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(ispell-program-name "/usr/local/bin/hunspell")
 '(require-final-newline t)
 '(sql-product (quote postgres)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "apple" :family "Monaco")))))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
(put 'upcase-region 'disabled nil)
