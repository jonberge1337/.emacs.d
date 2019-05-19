;; [[file:~/.emacs.d/myinit.org::*Repositorios][Repositorios:1]]
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; Repositorios:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:1]]
(setq inhibit-startup-message t) ; Quitar el mensaje del principio
(tool-bar-mode -1) ; Quitar el menu de copiar pegar 
(menu-bar-mode -1) ; Quitar el menu de archivo 
(scroll-bar-mode -1) ; Quitar la barra de scroll
;; Variables de inicio:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:2]]
(if (eq system-type 'windows-nt)
  (setq default-frame-alist '((font . "Consolas-12:antialias=natural")))
  (setq default-frame-alist '((font . "Dejavu Sans Mono-12")))
  )
;; Variables de inicio:2 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:3]]
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
;; Variables de inicio:3 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:4]]
(show-paren-mode 1) ;; remarca parentesis llaves y corchetes
(setq show-paren-delay 0) ;; evitar tiempo de espera al remarcar
;; Variables de inicio:4 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:5]]
(setq-default indent-tabs-mode t) ;; tabulaciones no espacios
(setq-default tab-width 4) ;; tabulaciones de cuatro caracteres
;; Variables de inicio:5 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:6]]
(global-linum-mode 1) ;; ver numero de linea
;; Variables de inicio:6 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:7]]
(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)
;; Variables de inicio:7 ends here

;; [[file:~/.emacs.d/myinit.org::*Try][Try:1]]
(use-package try
:ensure t)
;; Try:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Which%20key][Which key:1]]
(use-package which-key
:ensure t 
:config
(which-key-mode))
;; Which key:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Org%20mode][Org mode:1]]
(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; Org mode:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Autopair][Autopair:1]]
(use-package autopair
:disabled
:config
(autopair-global-mode))

(setq electric-pair-pairs '(
						   (?\{ . ?\})
						   (?\( . ?\))
						   (?\[ . ?\])
						   (?\" . ?\")
						   (?\' . ?\')
						   ))
(electric-pair-mode t)
;; Autopair:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Ace%20windows%20cambiar%20ventanas%20facil][Ace windows cambiar ventanas facil:1]]
(use-package ace-window
:ensure t
:init
(progn
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
  ))
;; Ace windows cambiar ventanas facil:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Swiper%20/%20Ivy%20/%20Counsel][Swiper / Ivy / Counsel:1]]
(use-package counsel
  :ensure t
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))


(use-package swiper
  :ensure try
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))
;; Swiper / Ivy / Counsel:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Avy%20-%20acceso%20rapido%20por%20letras][Avy - acceso rapido por letras:1]]
(use-package avy
:ensure t
:bind ("M-s" . avy-goto-word-1)) ;; changed from char as per jcs
;; Avy - acceso rapido por letras:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Autocomplete][Autocomplete:1]]
(use-package auto-complete
:ensure t
:init
(progn
  (ac-config-default)
  (global-auto-complete-mode t)
  ))
;; Autocomplete:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Themes][Themes:1]]
;; (use-package color-theme-sanityinc-tomorrow
;; :ensure t
;; :config (load-theme 'sanityinc-tomorrow-eighties t))


;; (use-package zenburn-theme
;;   :ensure t
;;   :config (load-theme 'zenburn t))

;; (use-package gruvbox-theme
;;   :ensure t
;;   :config (load-theme 'gruvbox t))

(use-package alect-themes
  :ensure t
  :config (load-theme 'alect-dark t))

;; (use-package monokai
;;   :ensure t
;;   :config (load-theme 'monokai t))
;; Themes:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Themes][Themes:2]]
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
	(setq spaceline-buffer-encoding-abbrev-p nil)
	(setq spaceline-line-column-p nil)
	(setq spaceline-line-p nil)
	(setq powerline-default-separator (quote arrow))
	(spaceline-spacemacs-theme))
;; Themes:2 ends here

;; [[file:~/.emacs.d/myinit.org::*Themes][Themes:3]]
(setq display-time-24hr-format t)
(setq display-time-format "%H:%M - %d %B %Y")
(display-time-mode 1)
;; Themes:3 ends here

;; [[file:~/.emacs.d/myinit.org::*Flycheck][Flycheck:1]]
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;; Flycheck:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Python][Python:1]]
(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))
;; Python:1 ends here
