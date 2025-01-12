;; CUSTOM
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(column-number-mode t)
 '(custom-enabled-themes '(modus-operandi))
 '(delete-selection-mode t)
 '(package-selected-packages '(slime paredit magit))
 '(prog-mode-hook '(display-line-numbers-mode))
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MonoLisa" :foundry "FCTP" :slant normal :weight regular :height 128 :width normal)))))

;; PACKAGE
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; MAGIT
(use-package magit
  :ensure t)

;; PAREDIT
(use-package paredit
  :ensure t
  :hook (lisp-mode emacs-lisp-mode))

;; SLIME
(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))
