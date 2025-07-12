;;; -*- lexical-binding: t -*-
(setopt custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(delete-selection-mode 1)
(indent-tabs-mode -1)
(savehist-mode 1)
(which-key-mode 1)

(load-theme 'modus-vivendi)
(set-face-attribute 'default nil :family "MonoLisa" :height 120)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setopt inhibit-startup-screen t)
(setopt tab-always-indent 'complete)
(setopt text-mode-ispell-word-completion nil)
(setopt read-extended-command-predicate 'command-completion-default-include-p)
(setopt backup-directory-alist '(("." . "~/.emacs.d/backups/")))

(global-set-key (kbd "M-o") 'other-window)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(use-package magit
  :ensure t)

(use-package evil
  :ensure t)

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

(use-package cape
  :ensure t
  :bind ("C-c p" . cape-prefix-map)
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode))

(use-package eglot
  :ensure nil
  :config
  (add-to-list 'eglot-server-programs
               '((ruby-mode ruby-ts-mode) "ruby-lsp")))

(use-package rust-mode
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  :mode "\\.erb\\'")

(use-package markdown-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)
