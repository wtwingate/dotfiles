;;; -*- lexical-binding: t -*-
(setopt custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror)

(menu-bar-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(line-number-mode 1)
(column-number-mode 1)
(which-key-mode 1)
(context-menu-mode 1)
(delete-selection-mode 1)
(savehist-mode 1)
(editorconfig-mode 1)

(setopt user-full-name "William Wingate"
        user-mail-address "wtwingate@gmail.com"
        inhibit-startup-screen t
        indent-tabs-mode nil
        tab-always-indent 'complete
        enable-recursive-minibuffers t
        backup-directory-alist '(("." . "~/.emacs.d/backups/")))

(keymap-global-set "M-o" 'other-window)
(keymap-global-set "M-/" 'hippie-expand)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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
  (add-hook 'completion-at-point-functions 'cape-dabbrev)
  (add-hook 'completion-at-point-functions 'cape-file)
  (add-hook 'completion-at-point-functions 'cape-elisp-block))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides nil))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode))

(use-package web-mode
  :ensure t
  :mode "\\.erb\\'"
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-script-padding 2))

(use-package markdown-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)
