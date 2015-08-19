;;
;; Package management
;;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(setq package-archive-priorities
      '(("melpa-stable" . 20)
        ("melpa" . 0)))

(package-initialize)

;;
;; Add local lisp and info directories
;;

(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'Info-default-directory-list "~/.emacs.d/info/")

(setenv "PATH"
  (concat "/usr/local/ghc-7.8.4/bin:" (getenv "PATH")))

(setq exec-path
  (append '("/usr/local/ghc-7.8.4/bin") exec-path))


;;
;; Customise UI and UX
;;

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
(when (not (package-installed-p 'smooth-scrolling))
  (package-refresh-contents)
  (package-install 'smooth-scrolling))
(require 'smooth-scrolling)

;; Whitespace
;
; Highlight whitespace in inappropriate places.
(setq whitespace-style '(face trailing lines-tail tabs))
(global-whitespace-mode 1)

(transient-mark-mode 1)

;; Key bindings
(global-set-key (kbd "C-x a r") 'align-regexp)

(when (not (package-installed-p 'pretty-mode))
  (package-refresh-contents)
  (package-install 'pretty-mode))
(require 'pretty-mode)

;;
;; Markdown
;;

(when (not (package-installed-p 'markdown-mode))
  (package-refresh-contents)
  (package-install 'markdown-mode))
(require 'markdown-mode)

(when (not (package-installed-p 'pandoc-mode))
  (package-refresh-contents)
  (package-install 'pandoc-mode))
(require 'pandoc-mode)

(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'markdown-mode-hook 'auto-fill-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))

;;
;; Haskell
;;

(when (not (package-installed-p 'haskell-mode))
  (package-refresh-contents)
  (package-install 'haskell-mode))
(when (not (package-installed-p 'ghc))
  (package-refresh-contents)
  (package-install 'ghc))

(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

(define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
(define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)

(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

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
;; Idris
;;

(when (not (package-installed-p 'idris-mode))
  (package-refresh-contents)
  (package-install 'idris-mode))

;;
;; JonPRL
;;

(when (not (package-installed-p 'jonprl-mode))
  (package-refresh-contents)
  (package-install 'jonprl-mode))
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
;; CSV Mode
;;

(when (not (package-installed-p 'csv-mode))
  (package-refresh-contents)
  (package-install 'csv-mode))
(require 'csv-mode)

;;
;; Graphviz
;;

(when (not (package-installed-p 'graphviz-dot-mode))
  (package-refresh-contents)
  (package-install 'graphviz-dot-mode))
(require 'graphviz-dot-mode)

;;
;; Puppet
;;

(when (not (package-installed-p 'puppet-mode))
  (package-refresh-contents)
  (package-install 'puppet-mode))
(require 'puppet-mode)

;;
;; Nginx
;;

(when (not (package-installed-p 'nginx-mode))
  (package-refresh-contents)
  (package-install 'nginx-mode))
(require 'nginx-mode)

;;
;; YAML
;;

(when (not (package-installed-p 'yaml-mode))
  (package-refresh-contents)
  (package-install 'yaml-mode))
(require 'yaml-mode)

;;
;; Python
;;

(add-hook 'python-mode-hook
  (lambda ()
    (setq tab-width 4)))

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
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(require-final-newline t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "apple" :family "Monaco")))))
