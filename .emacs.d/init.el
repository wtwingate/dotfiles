(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("." . "~/.emacs.d/backup/")))
 '(c-basic-offset 4)
 '(column-number-mode t)
 '(custom-enabled-themes '(modus-operandi))
 '(delete-selection-mode t)
 '(fill-column 72)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(cape corfu go-mode magit marginalia markdown-mode orderless paredit
          rust-mode slime vertico web-mode yaml-mode))
 '(prog-mode-hook '(display-line-numbers-mode))
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(tab-always-indent 'complete)
 '(tool-bar-mode nil)
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MonoLisa" :foundry "FCTP" :slant normal :weight regular :height 120 :width normal)))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package magit
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
  (add-hook 'completion-at-point-functions #'cape-file))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package paredit
  :ensure t
  :hook (emacs-lisp-mode lisp-mode))

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))

(use-package go-mode
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  :mode
  ("\\.astro\\'" "\\.erb\\'"))

(use-package yaml-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)
