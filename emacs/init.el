(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;; Initial buffer
(setq initial-major-mode 'org-mode)

(setq inferior-lisp-program "sbcl")

;; disable menu-bar, scroll-bar and tool-bar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; If not present, install 'use-package.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
;; Pull missing packages
(setq use-package-always-ensure t)

;; Auto activates company-mode for every mode
(use-package company
  :config (global-company-mode t))

(use-package paredit
  :hook ((emacs-lisp-mode
	  lisp-mode
	  eval-expression-minibuffer-setup
	  lisp-interaction) . enable-paredit-mode))

(use-package yasnippet
  :config (yas-global-mode t))

(use-package rainbow-delimiters
  :hook ((prog-mode) . rainbow-delimiters-mode-enable))

(use-package ox-latex
  )

;; enable latex export from org
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "72e041c9a2cec227a33e0ac4b3ea751fd4f4039235035894bf18b1c0901e1bd6" "e5dc5b39fecbeeb027c13e8bfbf57a865be6e0ed703ac1ffa96476b62d1fae84" "04589c18c2087cd6f12c01807eed0bdaa63983787025c209b89c779c61c3a4c4" default))
 '(fringe-mode 6 nil (fringe))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "~/Documents/todo.org")
 '(initial-frame-alist '((fullscreen . maximized)))
 '(initial-major-mode 'org-mode)
 '(initial-scratch-message
   "#+title What a wonderful day <3
#+autor Timo 'eXodiquas' Netzer
")
 '(linum-format 'dynamic)
 '(menu-bar-mode nil)
 '(org-agenda-files '("~/Documents/todo.org"))
 '(package-selected-packages
   '(switch-window lsp-ui racer lsp-mode company-box lsp-latex dmenu spacemacs-theme space-theming sly paredit ac-dcd xresources-theme d-mode crystal-mode latex-preview-pane company ac-cider clojure-snippets cherry-blossom-theme rainbow-delimiters neotree projectile cider-eval-sexp-fu cider-hydra cider yasnippet-snippets yasnippet-classic-snippets spinner sesman queue pkg-info parseedn clojure-mode ac-sly))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono for Powerline" :foundry "PfEd" :slant normal :weight normal :height 115 :width normal)))))
