;;; noname-theme.el --- no description, but it should be whity and plainy

;; Author: Maxim Kim <habamax@gmail.com>
;; Url: https://github.com/habamax/noname-theme
;; Package-Requires: ((emacs "24"))

;;; Commentary:

;; tbd
;; 1. keywords -- reddish
;; 2. strings -- greenish
;; 3. comments -- grayish

;;; Code:

(deftheme noname "and no description yet...")

(let
    ((noname-fg "#000000")
     (noname-bg "#f0f0f0")
     ;; (noname-bg-modeline-active "#2f4f4f")
     ;; (noname-bg-modeline-inactive "#202020")
     ;; (noname-box-modeline-active "#3f5f5f")
     ;; (noname-box-modeline-inactive "#303030")
     (noname-keyword "#b00000")
     (noname-str "#008000")
     ;; (noname-comment "#979760")
     (noname-comment "#777777")
     ;; (noname-comment "#5797a0")
     ;; (noname-gray "#7a7a7a")
     ;; (noname-fg-dim "#777777")
     ;; (noname-bg-dim "#101010")
     ;; (noname-fg-dim-2 "#506060")
     ;; (noname-fg-todo "#bdabab")
     ;; (noname-bg-todo "#775555")
     ;; (noname-fg-done "#abbdab")
     ;; (noname-bg-done "#777777")
     (noname-title "#000000")
     (noname-heading "#000000")
     ;; (noname-bg-hl-parens "#703000")
     ;; (noname-bg-alt "#252520")
     ;; (noname-fg-modeline-hl "#ffff00")
     ;; (noname-bg-whitespace "#1a1a1f")
     ;; (noname-fg-whitespace "#303040")
     ;; (noname-fg-search "#fff68f")
     ;; (noname-bg-search "#606020")
     ;; (noname-fg-lazysearch "#40e0d0")
     ;; (noname-bg-lazysearch "#206060")
     ;; (noname-fg-search-fail "#da70d6")
     ;; (noname-bg-search-fail "#603060")
     ;; (noname-bg-highlight "#203040")
     ;; (noname-fg-url "#90a0bd")
)



  (custom-theme-set-faces
   'noname

   ;; standard faces
   `(default ((t (:background ,noname-bg :foreground ,noname-fg))))
   '(cursor ((nil (:background "#000000"))))
   ;; `(region ((t (:background "#839191" :foreground ,noname-bg))))
   ;; `(highlight ((nil (:background ,noname-bg-highlight))))
   ;; '(bold ((t (:weight bold))))
   ;; '(minibuffer-prompt ((t (:foreground "#00ff00" :weight bold))))
   ;; '(widget-field-face ((t (:background "#a0a0a0" :foreground "#000000"))))
   ;; `(header-line ((t (:foreground ,noname-keyword :background "#404040"))))
   
   
   ;; `(isearch ((t (:background ,noname-bg-search :foreground ,noname-fg-search :weight bold :underline (:color ,noname-fg-search)))))
   ;; `(lazy-highlight ((t (:background ,noname-bg-lazysearch :foreground ,noname-fg-lazysearch :weight bold :underline (:color ,noname-fg-lazysearch)))))
   ;; match?
   ;; `(isearch-fail ((t (:background ,noname-bg-search-fail :foreground ,noname-fg-search-fail :weight bold :underline (:color ,noname-fg-search-fail)))))


   ;; frame UI
   ;; `(mode-line ((t (:background ,noname-bg-modeline-active :foreground ,noname-keyword :box (:line-width 1 :color ,noname-box-modeline-active)))))
   ;; `(mode-line-inactive ((t (:background ,noname-bg-modeline-inactive :foreground ,noname-gray :box (:line-width 1 :color ,noname-box-modeline-inactive)))))
   ;; `(mode-line-highlight ((nil (:foreground ,noname-fg-modeline-hl :box (:line-width 1 :color ,noname-fg)))))
   ;; `(vertical-border ((nil (:foreground ,noname-box-modeline-inactive))))
   ;; `(fringe ((nil (:background ,noname-bg-dim))))


   ;; syntax font-lock I DO care about
   `(font-lock-string-face ((t (:foreground ,noname-str))))
   `(font-lock-comment-face ((t (:foreground ,noname-comment))))
   `(font-lock-keyword-face ((t (:foreground ,noname-keyword))))
   ;; syntax font-lock I DON'T care about
   '(font-lock-builtin-face ((t nil)))
   '(font-lock-type-face ((t nil)))
   '(font-lock-function-name-face ((t nil)))
   '(font-lock-variable-name-face ((t nil)))
   '(font-lock-constant-face ((t nil)))
   ;; review this later.
   ;; `(font-lock-regexp-grouping-backslash ((t (:foreground ,noname-str :weight bold))))
   ;; `(font-lock-regexp-grouping-construct ((t (:foreground ,noname-str :weight bold :slant italic))))


   ;; parenthesis and pairs
   ;; `(show-paren-match ((t :background ,noname-bg-hl-parens)))
   ;; `(sp-show-pair-match-face ((t (:background ,noname-bg-hl-parens))))


   ;; links
   ;; `(link ((t (:foreground ,noname-fg-url :underline (:color ,noname-fg-url)))))
   ;; `(link-visited ((t (:foreground ,noname-fg :underline (:color ,noname-fg)))))

   ;; dired
   ;; '(dired-directory ((t (:inherit font-lock-keyword-face :weight bold))))

   ;; flycheck
   ;; '(flycheck-warning ((t (:underline (:color "Wheat3" :style wave)))))
   ;; '(flycheck-error ((t (:underline (:color "Coral" :style wave)))))
   ;; '(flycheck-fringe-warning ((t (:foreground "Wheat3"))))
   ;; '(flycheck-fringe-error ((t (:foreground "Coral"))))

   ;; which-key
   ;; '(which-key-key-face ((t (:foreground "#ffa500"))))
   ;; '(which-key-separator-face ((t (:foreground "#4d4d4d"))))

   ;; company
   ;; '(company-tooltip ((t (:background "Gray20" :foreground "Gray80"))))
   ;; '(company-tooltip-selection ((t (:background "LightSteelBlue4" :foreground "White"))))
   ;; '(company-tooltip-annotation ((t (:foreground "Gray60" :slant italic))))
   ;; '(company-tooltip-annotation-selection ((t (:foreground "Gray80"))))
   ;; '(company-tooltip-common ((t (:slant italic))))
   ;; '(company-scrollbar-bg ((t (:background "Gray40"))))
   ;; '(company-scrollbar-fg ((t (:background "Gray80"))))
   ;; '(company-preview ((t (:inherit company-tooltip-selection))))
   ;; '(company-preview-common ((t (:inherit company-preview :slant italic))))

   ;; erc
   '(erc-current-nick-face ((t (:foreground "#ffffff"))))
;;   ;; if erc-nick-default-face has foreground setup then it could not be
;;   ;; overriden by erc-my-nick-face
;;   ;; '(erc-nick-default-face ((t (:foreground "#779977"))))
   ;; '(erc-my-nick-face ((t (:foreground "#cc5555"))))
   ;; '(erc-input-face ((t (:foreground "#8dbdbd"))))
   ;; '(erc-timestamp-face ((t (:foreground "Wheat"))))
   ;; '(erc-notice-face ((t (:foreground "#555555"))))
   ;; '(erc-action-face ((nil (:slant italic))))
   ;; '(erc-button ((t (:underlined on))))


   ;; rcirc
   ;; '(rcirc-server ((t (:foreground "#555555"))))
   ;; '(rcirc-timestamp ((t (:foreground "#555555"))))
   ;; '(rcirc-other-nick ((t (:foreground "#779977"))))
   ;; '(rcirc-my-nick ((t (:foreground "#cc5555"))))
   ;; `(rcirc-url ((t (:foreground ,noname-fg-url :weight normal :underline (:color ,noname-fg-url)))))


   ;; magit
   '(git-commit-summary ((t (:inherit font-lock-string-face))))

   ;; git gutter fringe
   ;; `(git-gutter-fr:modified ((nil (:background ,noname-bg-dim :foreground "#ff55ff"))))
   ;; `(git-gutter-fr:added ((nil (:background ,noname-bg-dim :foreground "#55ff55"))))
   ;; `(git-gutter-fr:deleted ((nil (:background ,noname-bg-dim :foreground "#ff5555"))))


   ;; ivy
   ;; `(ivy-current-match ((t (:background ,noname-bg-highlight))))
   ;; `(ivy-minibuffer-match-face-1 ((t (:foreground ,noname-fg-dim))))
   ;; `(ivy-minibuffer-match-face-2 ((t (:foreground ,noname-fg-search :weight bold :underline (:color ,noname-fg-search)))))
   ;; `(ivy-minibuffer-match-face-3 ((t (:foreground ,noname-fg-lazysearch :weight bold :underline (:color ,noname-bg-lazysearch)))))
   ;; `(ivy-minibuffer-match-face-4 ((t (:foreground ,noname-fg-search-fail :weight bold :underline (:color ,noname-bg-search-fail)))))
   ;; `(ivy-modified-buffer ((nil (:foreground ,noname-keyword :slant italic))))
   ;; '(ivy-remote ((t (:inherit font-lock-comment-face))))
   ;; `(ivy-virtual ((t (:foreground ,noname-fg-dim))))

   ;; swiper
   ;; `(swiper-match-face-1 ((t (:foreground ,noname-fg-dim))))
   ;; `(swiper-match-face-2 ((t (:background ,noname-bg-search :foreground ,noname-fg-search :weight bold :underline (:color ,noname-fg-search)))))
   ;; `(swiper-match-face-3 ((t (:background ,noname-bg-lazysearch :foreground ,noname-fg-lazysearch :weight bold :underline (:color ,noname-bg-lazysearch)))))
   ;; `(swiper-match-face-4 ((t (:background ,noname-bg-search-fail :foreground ,noname-fg-search-fail :weight bold :underline (:color ,noname-bg-search-fail)))))
   

   ;; org
   ;; `(org-document-title ((t (:foreground ,noname-keyword :weight bold :height 1.6))))
   
   ;; `(org-level-1 ((t (:foreground ,noname-heading :weight bold :height 1.3))))
   ;; `(org-level-2 ((t (:foreground ,noname-heading :weight bold :height 1.2))))
   ;; `(org-level-3 ((t (:foreground ,noname-heading :weight bold :height 1.1))))

   ;; `(org-level-4 ((t (:foreground ,noname-heading :slant italic :height 1.1))))
   ;; `(org-level-5 ((t (:foreground ,noname-heading :slant italic :height 1.1))))
   ;; `(org-level-6 ((t (:foreground ,noname-heading :slant italic :height 1.1))))

   ;; `(org-level-7 ((t (:foreground ,noname-heading :slant italic :height 1))))
   ;; `(org-level-8 ((t (:foreground ,noname-heading :slant italic :height 1))))
   ;; `(org-level-9 ((t (:foreground ,noname-heading :slant italic :height 1))))
   ;; `(org-level-10 ((t (:foreground ,noname-heading :slant italic :height 1))))

   ;; `(org-tag ((nil (:foreground ,noname-comment))))

   ;; `(org-archived ((nil (:foreground ,noname-gray))))
   ;; todo: play with colors of the box
   ;; `(org-todo ((nil (:background ,noname-bg-todo :foreground ,noname-fg-todo :weight bold :box (:line-width 1 :color ,noname-fg-todo)))))
   ;; `(org-done ((nil (:background ,noname-bg-done :foreground ,noname-fg-done :weight bold :box (:line-width 1 :color ,noname-fg-done)))))
   
   ;; '(org-table ((t (:inherit default))))
   
   ;; `(org-date ((t (:foreground ,noname-comment :underline (:color ,noname-comment)))))
   
   ;; `(org-verbatim ((nil (:background ,noname-bg-alt :foreground ,noname-fg))))
   
   ;; `(org-special-keyword ((t (:foreground ,noname-gray :background ,noname-bg-modeline-inactive))))

   ;; `(org-agenda-structure ((t (:foreground ,noname-fg :height 1.6 :weight bold))))
   ;; `(org-agenda-date ((nil (:height 1.0))))
   ;; `(org-agenda-date-today ((t (:height 1.5 :weight bold))))
   ;; `(org-agenda-date-weekend ((t (:foreground ,noname-title :height 1.3))))

   ;; '(org-scheduled ((t (:inherit :default))))
   ;; `(org-scheduled-today ((t (:inherit :default :foreground ,noname-keyword))))
   ;; `(org-scheduled-previously ((t (:inherit :default :foreground "#d05050"))))
   ;; `(org-agenda-done ((t (:inherit :default :foreground ,noname-gray))))
   ;; `(org-warning ((t (:foreground "#d0a000"))))

   ;; `(org-agenda-clocking ((t (:background "#303030"))))

   ;; '(org-meta-line ((t (:foreground "#707070" ))))
   ;; '(org-document-info-keyword ((t (:inherit org-meta-line))))

   ;; `(org-block-begin-line ((t :foreground ,noname-comment)))
   ;; `(org-block-end-line ((t (:foreground ,noname-comment))))


   ;; calendar
   ;; `(calendar-month-header ((t (:foreground ,noname-keyword :weight bold))))
   ;; `(calendar-weekday-header ((t (:foreground ,noname-comment))))
   ;; `(calendar-weekend-header ((t (:foreground ,noname-str :weight bold))))
   ;; `(calendar-today ((t (:foreground ,noname-keyword :weight bold))))


   ;; emms
   ;; '(emms-playlist-track-face ((t (:inherit default))))
   ;; '(emms-playlist-selected-face ((t (:background "#20408b" :foreground "white" :weight bold))))


   ;; LaTeX
   ;; '(font-latex-sectioning-1-face ((t (:inherit org-level-1))))
   ;; '(font-latex-sectioning-2-face ((t (:inherit org-level-2))))
   ;; '(font-latex-sectioning-3-face ((t (:inherit org-level-3))))
   ;; '(font-latex-string-face ((t (:inherit font-lock-string-face))))
   ;; '(font-latex-bold-face ((t (:inherit bold))))

   ;; CSS
   ;; '(css-selector ((t (:inherit font-lock-keyword-face))))
;;   ;; '(css-property ((t (:inherit font-lock-keyword-face))))


   ;; XML
   ;; `(nxml-element-local-name ((t (:foreground ,noname-fg-dim))))
   ;; `(nxml-tag-delimiter ((t (:foreground ,noname-fg-dim))))
   ;; `(nxml-namespace-attribute-xmlns ((t (:foreground ,noname-fg-dim))))
   ;; `(nxml-attribute-local-name ((t (:foreground ,noname-fg-dim))))
   ;; `(nxml-attribute-value ((t (:foreground ,noname-str))))
   ;; `(nxml-cdata-section-CDATA ((t (:foreground ,noname-fg-dim))))
   ;; `(nxml-cdata-section-content ((t (:foreground ,noname-fg))))
   ;; `(nxml-cdata-section-delimiter ((t (:foreground ,noname-fg-dim-2))))


   ;; whitespace-mode
   ;; `(whitespace-space ((t (:foreground ,noname-fg-whitespace))))
   ;; `(whitespace-newline ((t (:foreground ,noname-fg-whitespace))))
   ;; `(whitespace-indentation ((t (:foreground ,noname-fg-whitespace :background ,noname-bg-whitespace))))
   ;; `(whitespace-line ((nil (:background ,noname-bg-whitespace))))


   ;; rainbow-delimiters
   ;; `(rainbow-delimiters-depth-1-face ((t (:foreground ,noname-fg))))
   ;; `(rainbow-delimiters-depth-2-face ((t (:foreground "#bd7070"))))
   ;; `(rainbow-delimiters-depth-3-face ((t (:foreground "#bdbd70"))))
   ;; `(rainbow-delimiters-depth-4-face ((t (:foreground "#7070bd"))))
   ;; `(rainbow-delimiters-depth-5-face ((t (:foreground "#bd70bd"))))
   ;; `(rainbow-delimiters-depth-6-face ((t (:foreground "#70bdbd"))))
   ;; `(rainbow-delimiters-depth-7-face ((t (:foreground "#bda090"))))
   ;; `(rainbow-delimiters-depth-8-face ((t (:foreground "#90a0bd"))))
   ;; `(rainbow-delimiters-depth-9-face ((t (:foreground "#a0bd90"))))


   ;; asciidoctor-mode
   ;; `(asciidoctor-header-delimiter-face ((t (:foreground ,noname-fg-dim))))

   `(asciidoctor-header-face-1 ((t (:foreground ,noname-title :weight bold :height 1.3))))
   `(asciidoctor-header-face-2 ((t (:foreground ,noname-heading :weight bold :height 1.3))))
   `(asciidoctor-header-face-3 ((t (:foreground ,noname-heading :weight bold :height 1.2))))
   `(asciidoctor-header-face-4 ((t (:foreground ,noname-heading :weight bold :height 1.1))))
   `(asciidoctor-header-face-5 ((t (:foreground ,noname-heading :slant italic :height 1.1))))
   `(asciidoctor-header-face-6 ((t (:foreground ,noname-heading :slant italic :height 1.1))))

   ;; `(asciidoctor-option-face ((t (:foreground ,noname-fg-dim))))
   ;; `(asciidoctor-option-markup-face ((t (:foreground ,noname-fg-dim))))


   ;; `(bongo-comment ((t (:foreground ,noname-fg-dim))))
   ;; `(bongo-elapsed-track-part ((t (:background ,noname-bg-alt))))
   ;; `(bongo-currently-playing-track ((t (:slant italic))))

   )
  )

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'noname)

;;; noname-theme.el ends here
