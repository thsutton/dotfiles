
;;
;; Add my local library dirs
;;
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))


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

