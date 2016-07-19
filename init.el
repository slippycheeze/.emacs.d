;;; init.el -- Emacs initialization file
;;; Maxim Kim <habamax@gmail.com>

;;; Commentary:
;; Carefully crafted settings for alien's editor I become used to.

;;; Code:

;; Non-Package setup

;; General OSX setup
(when (eq system-type 'darwin)
  ;; No new frames for files that are opened from OSX
  (setq ns-pop-up-frames nil)
  ;; command to meta, option to control
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'control))

(setq inhibit-startup-message t
      inhibit-splash-screen t
      initial-scratch-message "")

(setq user-full-name "Maxim Kim"
      user-mail-address "habamax@gmail.com")

;; RU stuff
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq default-input-method 'russian-computer)

;; make unix lineendings default
(setq default-buffer-file-coding-system 'utf-8-unix)

;; scroll to the top or bottom with C-v and M-v
(setq scroll-error-top-bottom t)

;; M-a and M-e use punct and single space as sentence delimiter
(setq sentence-end-double-space nil)

(delete-selection-mode 1)
(setq ring-bell-function #'ignore)
(setq disabled-command-function nil)
(setq suggest-key-bindings t)

(electric-indent-mode t)
(show-paren-mode t)
(column-number-mode t)
(recentf-mode 1)

;; fill text with M-q or auto-fill-mode
(setq-default fill-column 80)

;; winner mode is a must
(winner-mode 1)


;; tabs are evil but...
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;; y/n for yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Backups & Autosave
;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))


;; autosave position in file
(setq save-place-file (concat user-emacs-directory "saveplace"))
(setq-default save-place t)
(require 'saveplace)

;; C-u C-SPC C-SPC to pop mark twice...
(setq set-mark-command-repeat-pop t)

;; Tab to indent or complete
;; (setq tab-always-indent 'complete)

;; abbrev
(setq abbrev-file-name (concat user-emacs-directory "abbrev_defs"))
;; (setq save-abbrevs t)
(setq-default abbrev-mode t)

;; Keep 'Customize' stuff separated
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)


;; Set up packaging system
(let ((package-protocol (if (eq system-type 'windows-nt) "http://" "https://")))
  (setq package-archives `(("elpa" .  ,(concat package-protocol "elpa.gnu.org/packages/"))
                           ("melpa" . ,(concat package-protocol "melpa.org/packages/")))))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)


;; Local packages
(use-package haba-stuff
  :ensure nil
  :demand
  :commands (haba/next-buffer haba/previous-buffer haba/toggle-window-split haba/fill-or-unfill)
  :load-path "lisp/"
  :bind (("M-;" . haba/toggle-comment)
         ("C-a" . haba/move-beginning-of-line)
         ("M-j" . haba/join-line)
         ("s-d" . haba/duplicate-line)
         ("C-c o i" . haba/open-init-file)
         ([remap fill-paragraph] . haba/fill-or-unfill)))


(use-package haba-appearance
  :ensure nil
  :demand
  :load-path "lisp/"
  ;; :bind (("s-t" . haba/toggle-theme)
         ;; ("C-c t" . haba/toggle-theme))
  :config
    (use-package leuven-theme :defer))




;; Melpa packages

;; PATH for OSX
(use-package exec-path-from-shell
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize)
  :if (eq system-type 'darwin))

(use-package which-key
  :defer 3
  :diminish which-key-mode
  :config (which-key-mode))

(use-package expand-region
  :bind (("M-m" . er/expand-region))
  :config (setq expand-region-contract-fast-key "M"))

(use-package undo-tree
  :diminish undo-tree-mode
  :config (global-undo-tree-mode 1))

(use-package avy
  :diminish avy-mode
  :bind (("C-;" . avy-goto-char-timer)
         ("M-g g" . avy-goto-line)
         ("M-g w" . avy-goto-word-1))
  )

(use-package smex
  :defer
  ;; :bind (("M-x" . smex))
  )

;; (use-package ido
;;   :init
;;   ;; display any item that contains the chars you typed
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-everywhere t)
;;   (setq ido-use-virtual-buffers t)
;;   (setq ido-use-filename-at-point 'guess)
;;   (setq ido-create-new-buffer 'always)
;;   :config
;;   (ido-mode 1)
;;   (use-package ido-ubiquitous :config (ido-ubiquitous-mode 1)))


(use-package ivy
  :diminish ivy-mode
  :init
  ;; clear default ^ for counsel-M-x and friends
  (setq ivy-initial-inputs-alist '())
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-re-builders-alist
        ;; '((t . ivy--regex-fuzzy)))
        '((t . ivy--regex-ignore-order))))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c s" . haba/counsel-pt-choose-dir)
         ("C-s" . counsel-grep-or-swiper)
         ("C-r" . counsel-grep-or-swiper)
         ("C-x b" . ivy-switch-buffer)
         ("s-b" . ivy-switch-buffer))
  :config
  (setq counsel-find-file-at-point t)
  (setq counsel-find-file-ignore-regexp
        (concat
         ;; file names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; file names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)"))

  (defun haba/counsel-pt-choose-dir ()
    (interactive)
    (setq current-prefix-arg '(4))
    (counsel-pt))
  )


(use-package hydra
  :bind ("C-c w" . hydra-windows/body)
  :bind ("C-c t" . hydra-toggle-theme/body)
  :bind ("C-x o" . hydra-other-window/body)

  :config

  (defhydra hydra-windows ()
    "Windows"
    ("w" winner-undo "Winner undo")
    ("W" winner-redo "Winner redo")
    ("t" haba/toggle-window-split "Toggle split")
    ("]" enlarge-window-horizontally "Enlarge horizontal")
    ("[" shrink-window-horizontally "Shrink horizontal")
    ("=" enlarge-window "Enlarge vertival")
    ("-" shrink-window "Shrink vertical")
    ("b" balance-windows "Balance windows")
    ("m" delete-other-windows "Maximize window")
    ("c" delete-window "Close window")
    ("SPC" nil "quit")
    ("q" nil "quit"))

  (defhydra hydra-toggle-theme
    (:body-pre (haba/toggle-theme))
    "Themes"
    ("t" (haba/toggle-theme) "Toggle next theme")
    ("SPC" nil "quit")
    ("q" nil "quit"))

  (defhydra hydra-other-window
    (:body-pre (other-window 1))
    "Other window"
    ("o" (other-window 1) "Next")
    ("O" (other-window -1) "Previous")
    ("SPC" nil "quit")
    ("q" nil "quit"))
  )

;; Complete Anything
(use-package company
  :defer 1
  :diminish company-mode
  :bind ("s-/" . company-complete)
  :config
  (progn
    (use-package company-flx :config (company-flx-mode +1))

    (setq company-minimum-prefix-length 2)

    (define-key company-active-map [tab] 'company-complete-selection)
    (define-key company-active-map (kbd "TAB") 'company-complete-selection)
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)

    (global-company-mode)))



(use-package multiple-cursors
  :bind-keymap (("C-x m" . haba/mc-map))
  :bind (("M-n" . mc/mark-next-like-this)
         ("M-p" . mc/mark-previous-like-this)
         ("M-N" . mc/unmark-next-like-this)
         ("M-P" . mc/unmark-previous-like-this)
         :map haba/mc-map
         ("m" . mc/mark-all-like-this-dwim)
         ("i" . mc/insert-numbers))
  :init
  (define-prefix-command 'haba/mc-map)
  (define-key ctl-x-map "m" 'haba/mc-map))





(use-package rainbow-delimiters
  :defer
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


(use-package smartparens
  :diminish smartparens-mode
  :defer 1
  :config
  (require 'smartparens-config)
  (setq sp-base-key-bindings 'sp)
  (sp-use-smartparens-bindings)
  (smartparens-global-mode)
  (show-smartparens-global-mode)

  ;; useful for org-mode and others
  (sp-pair "*" "*" :actions '(wrap))
  (sp-pair "_" "_" :actions '(wrap))
  (sp-pair "=" "=" :actions '(wrap))
  (sp-pair "+" "+" :actions '(wrap))
  (sp-pair "/" "/" :actions '(wrap))
  (sp-pair "$" "$" :actions '(wrap))
  (sp-pair "-" "-" :actions '(wrap))
)

(use-package magit
  :commands (magit-status)
  :bind ("C-c g" . magit-status)
  :config
  (setq magit-log-arguments '("--graph" "--show-signature")
        magit-push-always-verify nil
        magit-popup-use-prefix-argument 'default
        magit-revert-buffers t))


(use-package markdown-mode
  :mode ("\\.\\(markdown\\|md\\)$" . markdown-mode))

(use-package plantuml-mode
  :mode ("\\.\\(uml\\)$" . plantuml-mode))

(use-package go-mode
  :mode ("\\.\\(go\\)$" . go-mode))

(use-package web-mode
  :mode ("\\.\\(html\\|css\\)$" . web-mode))

;; flycheck
(use-package flycheck
  :defer
  :diminish 'flycheck-mode
  :config (global-flycheck-mode))

;; flyspell - use aspell instead of ispell
(use-package flyspell
  :defer
  :commands (flyspell-mode flyspell-prog-mode)
  :config (setq ispell-program-name (executable-find "aspell")
                ispell-extra-args '("--sug-mode=ultra")))


;; yasnippets
(use-package yasnippet
  :defer 2
  :config
  (yas-global-mode t))


(use-package clojure-mode
  :mode ("\\.\\(clj\\)$" . clojure-mode)
  :config
  (use-package cider
    :config
    (setq cider-repl-display-help-banner nil)))


(use-package auctex
  :mode ("\\.\\(tex\\)$" . latex-mode)
  :init
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq-default TeX-engine 'xetex)
  (setq-default TeX-PDF-mode t)
  (setq TeX-PDF-mode t)
)


;; music FTW
(use-package emms
  :bind (("C-c p m" . haba/emms-play-main)
         ("C-c p c" . emms-playlist-mode-go)
         ("C-c p p" . emms-pause)
         ("C-c p n" . emms-next)
         ("C-c p r" . emms-random)
         ("C-c p s" . emms-stop))
  :init
  ;; Well on OSX I get weird tramp error...
  ;; (setq emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)

  :config
  (setq emms-mode-line-icon-color "yellow")

  (emms-all)

  (require 'emms-history)
  (emms-history-load)

  (setq emms-repeat-playlist t)

  ;; OSX has simple afplay utility to play music
  (when (eq system-type 'darwin)
    (define-emms-simple-player afplay '(file)
      (regexp-opt '(".mp3" ".m4a" ".aac")) "afplay")
    (setq emms-player-list `(,emms-player-afplay))
    (add-hook 'kill-emacs-hook 'emms-stop))

  ;; Not sure if this is needed
  (setq emms-source-file-default-directory "~/Music")

  (defun haba/emms-play-main ()
    (interactive)
    (emms-play-directory "~/Music/smusic/main"))
  )


;; (use-package evil)

;; (use-package nyan-mode
  ;; :defer 3
  ;; :config
  ;; (nyan-mode))


;; Built-in packages

(use-package erc
  :defer
  :ensure nil
  :init
  (setq ;erc-fill-column (- (window-width) 2)
        erc-nick '("habamax" "mxmkm")
        erc-track-minor-mode t
        erc-autojoin-channels-alist '(("freenode.net" "#emacs")))
  (defun erc-freenode ()
    (interactive)
    (erc :server "irc.freenode.net" :port 6667 :nick "habamax"))

  :config
  (ignore-errors
    (load (concat user-emacs-directory "ercpwd"))
    (require 'erc-services)
    (erc-services-mode 1)

    (setq erc-prompt-for-nickserv-password nil)
    (setq erc-nickserv-passwords
          `((freenode (("habamax" . ,freenode-habamax-pass))))))

    )


(use-package calendar
  :ensure nil
  :init
  ;; Calendar -- говорим и показываем по русски.
  (setq calendar-date-style 'iso
        calendar-week-start-day 1
        calendar-day-name-array ["Вс" "Пн" "Вт" "Ср" "Чт" "Пт" "Сб"]
        calendar-month-name-array ["Январь" "Февраль" "Март" "Апрель"
                                   "Май" "Июнь" "Июль" "Август"
                                   "Сентябрь" "Октябрь" "Ноябрь" "Декабрь"]))


(use-package org
  :mode ("\\.\\(org|txt\\)$" . org-mode)
  :bind (("C-c o a" . org-agenda)
         ("C-c o l" . org-store-link)
         ("C-c o c" . org-capture))
  :config

  (setq org-src-fontify-natively t
        org-fontify-whole-heading-line t
        org-return-follows-link t
        org-special-ctrl-a/e t
        org-special-ctrl-k t
        org-src-tab-acts-natively nil)
  
  ;; auto-fill mode on for org
  (add-hook 'org-mode-hook 'auto-fill-mode)

  ;; unbind C-' as I often miss a key with C-\
  (define-key org-mode-map (kbd "C-'") nil)

  (setq org-directory "~/org")
  (setq org-default-notes-file "~/org/refile.org")


  

  (setq org-refile-targets '((nil :maxlevel . 3)
                             (org-agenda-files :maxlevel . 2)))
  ;; Refile in a single go
  (setq org-outline-path-complete-in-steps nil)
  ;; Show full paths for refiling
  (setq org-refile-use-outline-path 'file)

  ;; open docx files in default application (ie msword)
  (setq org-file-apps
        '(("\\.docx\\'" . default)
          ("\\.odt\\'" . default)
          ("\\.mm\\'" . default)
          ("\\.x?html?\\'" . default)
          ("\\.pdf\\'" . default)
          (auto-mode . emacs)))

  ;; Doesn't work
  ;; (setq org-image-actual-width 500)

  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "|" "DONE(d)")
                (sequence "HOLD(h@/!)" "|" "CANCELED(c@/!)"))))

  (setq org-tag-alist '(("misc" . ?m) ("tax" . ?t)
                        ("adastra" . ?a) ("sber" . ?s) ("REB" . ?r) ("pochta" . ?p)))
  ;; C-u C-c C-c to realign all tags
  (setq org-tags-column 65)
  ;; Place tags close to the right-hand side of the window
  (add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
  (defun place-agenda-tags ()
    "Put the agenda tags by the right border of the agenda window."
    (setq org-agenda-tags-column (- 4 (window-width)))
    (org-agenda-align-tags))

  (setq org-capture-templates
        (quote (("t" "Todo" entry (file org-default-notes-file)
                 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                ("n" "Note" entry (file org-default-notes-file)
                 "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                ("j" "Journal" entry (file+datetree "~/org/diary.org")
                 "* %?\n%U\n" :clock-in t :clock-resume t)
                ("w" "Org-protocol" entry (file org-default-notes-file)
                 "* TODO Review %c\n%U\n" :immediate-finish t))))


  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (sh . t)
     (plantuml . t)
     (ditaa . t)
     (dot . t)))

  (defun haba/org-confirm-babel-evaluate (lang body)
    (not (or (string= lang "ditaa")
             (string= lang "plantuml")
             (string= lang "dot"))))
  (setq org-confirm-babel-evaluate 'haba/org-confirm-babel-evaluate)

  ;; this has to be set up for different machines
  ;; XXX: refactor this
  ;; (setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/8037/plantuml.8037.jar")
  (setq org-plantuml-jar-path "c:/prg/bin/plantuml.jar")

  (setq org-ditaa-jar-path "c:/prg/bin/ditaa0_9.jar")

  

  ;; default export options
  (setq org-export-with-smart-quotes t
        org-export-with-emphasize t
        org-export-with-todo-keywords nil
        org-export-time-stamp-file nil)

  (setq org-html-postamble t)



  (use-package haba-latex
    :ensure nil
    :load-path "lisp/")
  )





;;; init.el ends here
