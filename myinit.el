;; [[file:~/.emacs.d/myinit.org::*Repositorios][Repositorios:1]]
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; Repositorios:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:1]]
(setq inhibit-startup-message t) ; Quitar el mensaje del principio
(tool-bar-mode -1) ; Quitar el menu de copiar pegar 
(menu-bar-mode -1) ; Quitar el menu de archivo 
(scroll-bar-mode -1) ; Quitar la barra de scroll
;; (set-frame-parameter nil 'undecorated t) ; Quitar titulo ventana
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
						   '((vertical-scroll-bars . nil)
							 (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)
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
(setq linum-format "%d ") ;; dejar espacio despues del numero de linea
;; Variables de inicio:6 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:7]]
(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)
;; Variables de inicio:7 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:8]]
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Variables de inicio:8 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:9]]
(fset 'yes-or-no-p 'y-or-n-p)
;; Variables de inicio:9 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:10]]
;; (add-hook 'emacs-startup-hook 'eshell)
;; Variables de inicio:10 ends here

;; [[file:~/.emacs.d/myinit.org::*Variables%20de%20inicio][Variables de inicio:11]]
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)
;; Variables de inicio:11 ends here

;; [[file:~/.emacs.d/myinit.org::*Try][Try:1]]
(use-package try
  :ensure t)
;; Try:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Posframe][Posframe:1]]
(use-package posframe
  :ensure t)
;; Posframe:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Which%20key][Which key:1]]
(use-package which-key
  :ensure t 
  :config
  (which-key-mode)
  )
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
	(setq aw-scope 'global) ;; was frame
	(global-set-key (kbd "C-x O") 'other-frame)
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
;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;; 	(ac-config-default)
;; 	(global-auto-complete-mode t)
;; 	))
;; Autocomplete:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Company][Company:1]]
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)

  (global-company-mode t)
  )


(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(use-package company-jedi
  :ensure t
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  )

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
;; Company:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Company][Company:2]]
(eval-after-load 'company
  '(progn
	 (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
	 (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))
;; Company:2 ends here

;; [[file:~/.emacs.d/myinit.org::*Drag-stuff][Drag-stuff:1]]
(use-package drag-stuff
  :ensure t
  :defer t
  :init (progn
		  (drag-stuff-global-mode 1)
		  (drag-stuff-define-keys))
  )
;; Drag-stuff:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Themes][Themes:1]]
(use-package color-theme-sanityinc-tomorrow
  :disabled
  :config (load-theme 'sanityinc-tomorrow-eighties t))


(use-package zenburn-theme
  :disabled
  :config (load-theme 'zenburn t))

(use-package gruvbox-theme
  :ensure t	  
  :config (load-theme 'gruvbox t))

(use-package alect-themes
  :disabled
  :config (load-theme 'alect-dark t))

(use-package monokai
  :disabled
  :config (load-theme 'monokai t))

(use-package atom-one-dark-theme
  :disabled	  
  :config (load-theme 'atom-one-dark t))
;; Themes:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Themes][Themes:2]]
(use-package doom-modeline
      :disabled
      (require 'doom-modeline)
      (doom-modeline-init)
      )
;; Themes:2 ends here

;; [[file:~/.emacs.d/myinit.org::*Themes][Themes:3]]
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq spaceline-buffer-encoding-abbrev-p nil)
  (setq spaceline-line-column-p nil)
  (setq spaceline-line-p nil)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme)
  (setq display-time-24hr-format t)
  (setq display-time-format "%H:%M - %d %B %Y")
  (display-time-mode 1)
  )
;; Themes:3 ends here

;; [[file:~/.emacs.d/myinit.org::*Flycheck][Flycheck:1]]
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;; Flycheck:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Python][Python:1]]
;; (use-package jedi
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (add-hook 'python-mode-hook 'jedi:ac-setup))

;; (setq py-python-command "python3")
;; (setq python-shell-interpreter "python3")


(use-package elpy
  :ensure t
  :config 
  (elpy-enable))

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))
;; Python:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Rust][Rust:1]]
(use-package rust-mode
      :ensure t)
(use-package flycheck-rust
      :ensure t)
;; Rust:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Ansi-term][Ansi-term:1]]
(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(global-set-key (kbd "<s-return>") 'ansi-term)
;; Ansi-term:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Navegador][Navegador:1]]
(if (eq system-type 'gnu/linux)
	(setq browse-url-browser-function 'browse-url-generic
		  browse-url-generic-program "/usr/bin/firefox")
  )
(if (eq system-type 'windows-nt)
	(setq browse-url-browser-function 'browse-url-default-windows-browser)
  )
(global-set-key (kbd "<s-tab>") 'browse-url)
;; Navegador:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Yanippet][Yanippet:1]]
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)
;; Yanippet:1 ends here
