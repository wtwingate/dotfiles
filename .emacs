;;; -*- lexical-binding: t -*-

;;      ___           ___           ___           ___           ___
;;     /\  \         /\__\         /\  \         /\  \         /\  \
;;    /::\  \       /::|  |       /::\  \       /::\  \       /::\  \
;;   /:/\:\  \     /:|:|  |      /:/\:\  \     /:/\:\  \     /:/\ \  \
;;  /::\~\:\  \   /:/|:|__|__   /::\~\:\  \   /:/  \:\  \   _\:\~\ \  \
;; /:/\:\ \:\__\ /:/ |::::\__\ /:/\:\ \:\__\ /:/__/ \:\__\ /\ \:\ \ \__\
;; \:\~\:\ \/__/ \/__/~~/:/  / \/__\:\/:/  / \:\  \  \/__/ \:\ \:\ \/__/
;;  \:\ \:\__\         /:/  /       \::/  /   \:\  \        \:\ \:\__\
;;   \:\ \/__/        /:/  /        /:/  /     \:\  \        \:\/:/  /
;;    \:\__\         /:/  /        /:/  /       \:\__\        \::/  /
;;     \/__/         \/__/         \/__/         \/__/         \/__/

;; Load custom file
(setopt custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror)

;; Enable/disable modes
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

;; Set user options
(setopt user-full-name "William Wingate"
        user-mail-address "wtwingate@gmail.com"
        inhibit-startup-screen t
        indent-tabs-mode nil
        tab-always-indent 'complete
        enable-recursive-minibuffers t
        backup-directory-alist '(("." . "~/.emacs.d/backups/")))

;; Define functions
(defun my-select-line ()
  "Select the current line, or extend the selection downward."
  (interactive)
  (if (use-region-p)
      (forward-line 1)
    (push-mark (line-beginning-position) t t)
    (forward-line 1)))

(defun my-open-line-below ()
  "Open line below the current line."
  (interactive)
  (end-of-line 1)
  (open-line 1)
  (forward-line 1)
  (indent-according-to-mode))

(defun my-open-line-above ()
  "Open line above the current line."
  (interactive)
  (beginning-of-line 1)
  (open-line 1)
  (indent-according-to-mode))

;; Set global keymaps
(keymap-global-set "M-o" 'other-window)
(keymap-global-set "M-/" 'hippie-expand)
(keymap-global-set "M-l" 'my-select-line)
(keymap-global-set "S-<return>" 'my-open-line-below)
(keymap-global-set "C-S-<return>" 'my-open-line-above)

;; Add hooks
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Configure LSP
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((ruby-mode ruby-ts-mode) . ("ruby-lsp"))))

;; Install and configure packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

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

(use-package csv-mode
  :ensure t)
