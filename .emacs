;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(web-mode slime paredit magit which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MonoLisa Variable" :foundry "FCTP" :slant normal :weight regular :height 120 :width normal)))))

;; User Info
(setq user-full-name "William Wingate")
(setq user-mail-address "wtwingate@gmail.com")

;; Color Theme
(load-theme 'modus-operandi)

;; UI Options
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Editor Settings
(setq c-default-style "linux")

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;; which-key
(use-package which-key
  :config
  (which-key-mode 1))

;; magit
(use-package magit)

;; paredit
(use-package paredit
  :hook (lisp-mode emacs-lisp-mode))

;; slime
(use-package slime
  :config
  (setq inferior-lisp-program "sbcl")
  :defer t)

;; web-mode
(use-package web-mode)
