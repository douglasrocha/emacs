(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      Custom Modes      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; rjsx-mode
(add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))
(setq js2-basic-offset 2)

;; scss-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/scss-mode-20180123.908"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; haskell-mode
(add-to-list 'load-path "~/.emacs-d/elpa/haskell-mode-20180406.2222/")
(add-to-list 'Info-default-directory-list "~/.emacs-d/elpa/haskell-mode-20180406.2222")

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

;; Replace text when on "selection mode"
(delete-selection-mode 1)
