;;; -*- lexical-binding: t -*-
(setopt user-full-name "William Wingate"
	user-mail-address "wtwingate@gmail.com")

(setopt inhibit-startup-screen t)

(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(line-number-mode 1)
(column-number-mode 1)

(savehist-mode 1)
(context-menu-mode 1)
(which-key-mode 1)

(delete-selection-mode 1)
(indent-tabs-mode -1)

(setopt c-default-style "linux")

(setopt sh-basic-offset 2
	sgml-basic-offset 2
	css-indent-offset 2
	js-indent-level 2)

(setopt backup-directory-alist '(("." . "~/.emacs.d/backups/")))

(setopt tab-always-indent 'complete)
(setopt text-mode-ispell-word-completion nil)
(setopt enable-recursive-minibuffers t)
(setopt read-extended-command-predicate
	#'command-completion-default-include-p)

(if (eq system-type 'darwin)
    (setopt mac-command-modifier 'meta))

(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'before-save-hook #'delete-trailing-whitespace)

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
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
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

(use-package go-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  :mode "\\.erb\\'")

(use-package yaml-mode
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-operandi-tinted))
 '(package-selected-packages
   '(cape corfu evil go-mode magit marginalia orderless vertico web-mode
	  yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MonoLisa" :foundry "FCTP" :slant normal :weight regular :height 120 :width normal)))))
