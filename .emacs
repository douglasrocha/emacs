;;;;;;;;;;;;;;;;;;
;; Repositories ;;
;;;;;;;;;;;;;;;;;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/"))

;;;;;;;;;;;;
;; Themes ;;
;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (omnisharp csharp-mode elm-mode elixir-mode slime clojure-mode flycheck-haskell yaml-mode haskell-mode scss-mode rjsx-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;
;; Custom Modes ;;
;;;;;;;;;;;;;;;;;;

;; rjsx-mode
(add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))
(setq js2-basic-offset 2)

;; scss-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/scss-mode-20180123.908"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; haskell-mode
(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)

;; csharp-mode
(defun my-csharp-mode-hook ()
  (electric-pair-local-mode 1))
(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

;; omnisharp
(add-hook 'csharp-mode-hook #'flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Default Configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Opens emacs always maximized
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Open frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Default tab (spaces) size
(setq tab-width 2)

;; Show column number
(setq column-number-mode t)

;; Replace text when on "selection mode"
(delete-selection-mode 1)
