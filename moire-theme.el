;;; moire-theme.el --- a moody pastel theme for Emacs -*- lexical-binding: t -*-

;; Copyright (c) 2023 Rylee Alanza Lyman

;; Author: Rylee Alanza Lyman <rylee.alanza@gmail.com>
;; Version: 1.0.0

;; Package-Requires: ((autothemer "0.2"))

;;; Commentary:
;; Inspired by catppuccin.

;;; Code:

(eval-when-compile
  (require 'cl-lib))

(require 'autothemer)

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

(defmacro moire-deftheme (name description palette &rest body)
  `(autothemer-deftheme
    ,name
    ,description
    ,palette
    ((default             (:background moire-floor :foreground moire-text))
     (default-italic      (:slant 'italic))
     (cursor              (:background moire-red :foreground moire-dirt))
     (mode-line           (:background moire-dirt :foreground moire-subtext :box nil))
     (mode-line-inactive  (:background moire-dirt :foreground moire-comment :box nil))
     (header-line         (:inherit 'mode-line))
     (fringe              (:background moire-dirt))
     (hl-region           (:background moire-table))
     (hl-todo             (:foreground moire-peach))
     (region              (:background moire-desk))
     (secondary-selection (:background moire-linoleum))
     (minibuffer-window   (:background moire-ground))
     (minibuffer-prompt   (:background moire-ground :bold t))
     (vertical-border     (:foreground moire-ground))
     (internal-border     (:background moire-table))
     (window-divider      (:foreground moire-table))
     (link                (:foreground moire-royal :underline t))
     (shadow              (:foreground moire-comment))
     (success             (:foreground moire-green))
     (warning             (:foreground moire-yellow))

     ;;; syntax hl

     (font-lock-builtin-face           (:foreground moire-red))
     (font-lock-constant-face          (:foreground moire-peach))
     (font-lock-comment-face           (:foreground moire-comment :slant 'italic))
     (font-lock-comment-delimiter-face (:foreground moire-subtext))
     (font-lock-doc-face               (:foreground moire-subtext))
     (font-lock-doc-markup-face        (:foreground moire-clay))
     (font-lock-function-name-face     (:foreground moire-blue))
     (font-lock-function-call-face     (:foreground moire-blue))
     (font-lock-keyword-face           (:foreground moire-mauve :weight 'bold))
     (font-lock-string-face            (:foreground moire-green))
     (font-lock-variable-name-face     (:foreground moire-mauve :slant 'italic))
     (font-lock-type-face              (:foreground moire-yellow))
     (font-lock-property-name-face     (:foreground moire-lavender))
     (font-lock-property-use-face      (:foreground moire-lavender))
     (font-lock-warning-face           (:inherit 'warning))
     (font-lock-negation-char-face     (:foreground moire-pink))
     (font-lock-preprocessor-face      (:foreground moire-yellow))
     (font-lock-regexp-face            (:foreground moire-peach))
     (font-lock-regexp-grouping-backslash (:foreground moire-teal :weight 'bold))
     (font-lock-regexp-grouping-construct (:foreground moire-teal :weight 'bold))
     (font-lock-escape-face            (:inherit 'font-lock-regexp-grouping-construct))
     (font-lock-operator-face          (:foreground moire-denim))
     (font-lock-punctuation-face       (:foreground moire-subtext))
     (font-lock-bracket-face           (:foreground moire-subtext))
     (font-lock-delimiter-face         (:foreground moire-subtext))
     (font-lock-misc-punctuation-face  (:foreground moire-subtext))

     ;;; basic faces

     (error               (:foreground moire-red :bold t :italic t))
     (success             (:foreground moire-teal :bold t :italic t))
     (warning             (:foreground moire-yellow :bold t :italic t))
     (alert-low-face      (:foreground moire-denim))
     (trailing-whitespace (:background moire-clay))
     (escape-glyph        (:foreground moire-pink))
     (header-line         (:background moire-ground :foreground moire-subtext :box nil :inherit nil))
     (highlight           (:background moire-linoleum :foreground moire-text))
     (homoglyph           (:foreground moire-yellow))
     (match               (:foreground moire-text :background moire-chartreuse))

     ;;; customize

     (widget-field        (:background moire-sofa))
     (custom-group-tag    (:foreground moire-blue :weight 'bold))
     (custom-variable-tag (:foreground moire-blue :weight 'bold))

     ;;; whitespace-mode

     (whitespace-space            (:background moire-linoleum :foreground moire-subtext))
     (whitespace-hspace           (:background moire-linoleum :foreground moire-subtext))
     (whitespace-tab              (:background moire-linoleum :foreground moire-subtext))
     (whitespace-newline          (:background moire-linoleum :foreground moire-red))
     (whitespace-trailing         (:background moire-linoleum :foreground moire-red))
     (whitespace-space-before-tab (:background moire-linoleum :foreground moire-subtext))
     (whitespace-indentation      (:background moire-linoleum :foreground moire-subtext))
     (whitespace-space-after-tab  (:background moire-linoleum :foreground moire-subtext))

     ;;; line numbers

     (line-number                     (:foreground moire-comment :background moire-ground))
     (line-number-current-line        (:foreground moire-clay :background moire-ground))
     (linum                           (:foreground moire-comment :background moire-ground))
     (linum-highlight-face            (:foreground moire-clay :background moire-ground))
     (linum-relative-current-face     (:foreground moire-clay :background moire-ground))

     ;;; Diffs

     (diff-header            (:background moire-carpet))
     (diff-file-header       (:background moire-carpet))
     (diff-hunk-header       (:background moire-carpet))
     (diff-context           (:background moire-carpet :foreground moire-subtext))
     (diff-added             (:background 'unspecified :foreground moire-green))
     (diff-refine-added      (:background 'unspecified :foreground moire-teal))
     (diff-removed           (:background 'unspecified :foreground moire-red))
     (diff-refine-removed    (:background 'unspecified :foreground moire-peach))
     (diff-indicator-changed (:inherit 'diff-changed))
     (diff-indicator-added   (:inherit 'diff-added))
     (diff-indicator-removed (:inherit 'diff-removed))

     ;;; popup

     (popup-face                (:underline nil :foreground moire-text :background moire-desk))
     (popup-menu-mouse-face     (:underline nil :foreground moire-mauve :background moire-desk))
     (popup-menu-selection-face (:underline nil :foreground moire-mauve :background moire-sofa))
     (popup-tip-face            (:underline nil :foreground moire-subtext :background moire-desk))

     ;;; tooltip

     (tooltip (:foreground moire-subtext :background moire-desk))

     ;;; corfu

     (corfu-default (:inherit 'tooltip))
     (corfu-current (:foreground moire-mauve :background moire-sofa))
     (corfu-bar (:background moire-desk))
     (corfu-border (:background moire-table))

     ;;; term
     (term-color-black    (:foreground moire-dirt :background moire-dirt))
     (term-color-blue     (:foreground moire-blue :background moire-blue))
     (term-color-red      (:foreground moire-red :background moire-red))
     (term-color-cyan     (:foreground moire-teal :background moire-teal))
     (term-color-green    (:foreground moire-green :background moire-green))
     (term-color-magenta  (:foreground moire-mauve :background moire-mauve))
     (term-color-white    (:foreground moire-text :background moire-text))
     (term-default-fg-color (:foreground moire-text))
     (term-default-bg-color (:background moire-floor))

     ;;; org-mode

     (org-hide                 (:foreground moire-subtext))
     (org-level-1              (:foreground moire-pink :height 1.3))
     (org-level-2              (:foreground moire-mauve :height 1.2))
     (org-level-3              (:foreground moire-subtext :height 1.2))
     (org-level-4              (:foreground moire-clay :height 1.1))
     (org-level-5              (:foreground moire-yellow :height 1.1))
     (org-level-6              (:foreground moire-chartreuse))
     (org-level-7              (:foreground moire-teal))
     (org-level-8              (:foreground moire-green))
     (org-special-keyword      (:inherit 'font-lock-comment-face))
     (org-drawer               (:inherit 'font-lock-function-name-face))
     (org-column               (:background moire-rug))
     (org-column-title         (:background moire-rug :underline t :weight 'bold))
     (org-warning              (:foreground moire-red :weight 'bold :underline nil))
     (org-archived             (:foreground moire-subtext :weight 'bold))
     (org-link                 (:inherit 'link))
     (org-footnote             (:foreground moire-teal :underline t))
     (org-ellipsis             (:foreground moire-subtext))
     (org-date                 (:foreground moire-blue :underline t))
     (org-sexp-date            (:foreground moire-blue :underline t))
     (org-tag                  (:weight 'bold))
     (org-list-dt              (:weight 'bold))
     (org-todo                 (:foreground moire-red :weight 'bold))
     (org-done                 (:foreground moire-teal :weight 'bold))
     (org-agenda-done          (:foreground moire-teal))
     (org-headline-done        (:foreground moire-teal))
     (org-table                (:foreground moire-subtext))
     (org-block                (:background moire-carpet))
     (org-block-begin-line     (:background moire-rug))
     (org-block-end-line       (:background moire-rug))
     (org-document-info        (:foreground moire-blue))
     (org-document-title       (:foreground moire-blue))
     (org-agenda-structure     (:inherit 'font-lock-comment-face))
     (org-agenda-date-today    (:foreground moire-text :weight 'bold :slant 'italic))
     (org-scheduled            (:foreground moire-yellow))
     (org-scheduled-today      (:foreground moire-denim))
     (org-scheduled-previously (:foreground moire-peach))
     (org-upcoming-deadline    (:inherit 'font-lock-keyword-face))
     (org-deadline-announce    (:foreground moire-peach))
     (org-time-grid            (:foreground moire-clay))
     (org-latex-and-related    (:foreground moire-blue))

     ;;; show-paren

     (show-paren-match    (:background moire-sofa :foreground moire-blue :weight 'bold))
     (show-paren-mismatch (:background moire-red :foreground moire-sofa :weight 'bold))

     ;;; orderless

     (orderless-match-face-0 (:foreground moire-yellow))
     (orderless-match-face-1 (:foreground moire-clay))
     (orderless-match-face-2 (:foreground moire-blue))
     (orderless-match-face-3 (:foreground moire-purple))

     ;;; magit

     (magit-bisect-bad                          (:foreground moire-red))
     (magit-bisect-good                         (:foreground moire-green))
     (magit-bisect-skip                         (:foreground moire-clay))
     (magit-blame-heading                       (:foreground moire-text :background moire-floor))
     (magit-branch-local                        (:foreground moire-blue))
     (magit-branch-current                      (:underline moire-denim :inherit 'magit-branch-local))
     (magit-branch-remote                       (:foreground moire-green))
     (magit-cherry-equivalent                   (:foreground moire-lavender))
     (magit-cherry-unmatched                    (:foreground moire-teal))
     (magit-diff-added                          (:foreground moire-green))
     (magit-diff-added-highlight                (:foreground moire-green :inherit 'magit-diff-context-highlight))
     (magit-diff-base                           (:background moire-carpet :foreground moire-text))
     (magit-diff-base-highlight                 (:background moire-carpet :foreground moire-subtext))
     (magit-diff-context                        (:background moire-carpet :foreground moire-text))
     (magit-diff-context-highlight              (:background moire-carpet :foreground moire-subtext))
     (magit-diff-hunk-heading                   (:background moire-carpet :foreground moire-text))
     (magit-diff-hunk-heading-highlight         (:background moire-carpet :foreground moire-text))
     (magit-diff-hunk-heading-selection         (:background moire-carpet :foreground moire-peach))
     (magit-diff-lines-heading                  (:background moire-carpet :foreground moire-text))
     (magit-diff-removed                        (:foreground moire-red))
     (magit-diff-removed-highlight              (:foreground moire-red :inherit 'magit-diff-context-highlight))
     (magit-diffstat-added                      (:foreground moire-green))
     (magit-diffstat-removed                    (:foreground moire-red))
     (magit-dimmed                              (:foreground moire-subtext))
     (magit-hash                                (:foreground moire-denim))
     (magit-log-author                          (:foreground moire-mauve))
     (magit-log-date                            (:foreground moire-teal))
     (magit-log-graph                           (:foreground moire-subtext))
     (magit-process-ng                          (:foreground moire-red :weight 'bold))
     (magit-process-ok                          (:foreground moire-green :weight 'bold))
     (magit-reflog-amend                        (:foreground moire-lavender))
     (magit-reflog-checkout                     (:foreground moire-denim))
     (magit-reflog-cherry-pick                  (:foreground moire-green))
     (magit-reflog-commit                       (:foreground moire-green))
     (magit-reflog-merge                        (:foreground moire-green))
     (magit-reflog-other                        (:foreground moire-teal))
     (magit-reflog-rebase                       (:foreground moire-lavender))
     (magit-reflog-remote                       (:foreground moire-denim))
     (magit-reflog-reset                        (:foreground moire-red))
     (magit-refname                             (:foreground moire-subtext))
     (magit-section-heading                     (:foreground moire-yellow :weight 'bold))
     (magit-section-heading-selection           (:foreground moire-clay))
     (magit-section-highlight                   (:background moire-rug))
     (magit-sequence-drop                       (:foreground moire-clay))
     (magit-sequence-head                       (:foreground moire-teal))
     (magit-sequence-part                       (:foreground moire-yellow))
     (magit-sequence-stop                       (:foreground moire-green))
     (magit-signature-bad                       (:foreground moire-red :weight 'bold))
     (magit-signature-error                     (:foreground moire-red))
     (magit-signature-expired                   (:foreground moire-peach))
     (magit-signature-good                      (:foreground moire-green))
     (magit-signature-revoked                   (:foreground moire-lavender))
     (magit-signature-untrusted                 (:foreground moire-blue))
     (magit-tag                                 (:foreground moire-yellow))

     ;;; diff-hl

     (diff-hl-insert (:foreground moire-green))
     (diff-hl-change (:foreground moire-clay))
     (diff-hl-delete (:foreground moire-red))

     ;;; flyspell

     (flyspell-duplicate (:underline (:color moire-lavender :style 'wave)))
     (flyspell-incorrect (:underline (:color moire-red :style 'wave)))

     ;;; latex

     (font-latex-bold-face         (:foreground moire-peach :weight 'bold))
     (font-latex-italic-face       (:foreground moire-peach :slant 'italic))
     (font-latex-math-face         (:foreground moire-denim))
     (font-latex-script-char-face  (:foreground moire-teal))
     (font-latex-sectioning-1-face (:inherit 'org-level-1))
     (font-latex-sectioning-2-face (:inherit 'org-level-2))
     (font-latex-sectioning-3-face (:inherit 'org-level-3))
     (font-latex-sectioning-4-face (:inherit 'org-level-4))
     (font-latex-sectioning-5-face (:inherit 'org-level-5))
     (font-latex-sedate-face       (:foreground moire-subtext))
     (font-latex-string-face       (:foreground moire-green))
     (font-latex-verbatim-face     (:inherit 'font-lock-builtin-face))
     (font-latex-warning-face      (:inherit 'warning))
     (preview-face                 (:inherit 'font-latex-math-face))

     ;;; shell script

     (sh-quoted-exec (:foreground moire-lavender))
     (sh-heredoc (:foreground moire-green))

     ;;; widget faces

     (widget-button-pressed-face (:foreground moire-pink))
     (widget-documentation-face  (:foreground moire-green))
     (widget-field               (:foreground moire-subtext :background moire-carpet))
     (widget-single-line-field   (:foreground moire-subtext :background moire-carpet))

     ;;; eshell

     (eshell-prompt                              (:foreground moire-teal))
     (eshell-ls-archive                          (:foreground moire-subtext))
     (eshell-ls-backup                           (:foreground moire-subtext))
     (eshell-ls-clutter                          (:foreground moire-clay :weight 'bold))
     (eshell-ls-directory                        (:foreground moire-yellow))
     (eshell-ls-executable                       (:weight 'bold))
     (eshell-ls-missing                          (:foreground moire-red :bold t))
     (eshell-ls-product                          (:foreground moire-peach))
     (eshell-ls-readonly                         (:foreground moire-subtext))
     (eshell-ls-special                          (:foreground moire-yellow :bold t))
     (eshell-ls-symlink                          (:foreground moire-clay))
     (eshell-ls-unreadable                       (:foreground moire-red :bold t))

     ;;; flycheck

     (flycheck-warning                          (:underline (:style 'wave :color moire-yellow)))
     (flycheck-error                            (:underline (:style 'wave :color moire-red)))
     (flycheck-info                             (:underline (:style 'wave :color moire-royal)))
     (flycheck-fringe-warning                   (:foreground moire-yellow))
     (flycheck-fringe-error                     (:foreground moire-red))
     (flycheck-fringe-info                      (:foreground moire-royal))
     (flycheck-error-list-warning               (:foreground moire-yellow :bold t))
     (flycheck-error-list-error                 (:foreground moire-red :bold t))
     (flycheck-error-list-info                  (:foreground moire-royal :bold t))

     ;;; vertico

     (vertico-posframe            (:background moire-ground))
     (vertico-posframe-border     (:background moire-dirt))
     (vertico-posframe-border-2   (:background moire-ground))
     (vertico-posframe-border-3   (:background moire-floor))
     (vertico-posframe-border-4   (:background moire-carpet))

     ;;; ansi-color

     (ansi-color-black          (:foreground moire-floor  :background moire-floor))
     (ansi-color-red            (:foreground moire-peach  :background moire-peach))
     (ansi-color-green          (:foreground moire-green  :background moire-green))
     (ansi-color-yellow         (:foreground moire-clay   :background moire-clay))
     (ansi-color-blue           (:foreground moire-royal  :background moire-royal))
     (ansi-color-magenta        (:foreground moire-mauve  :background moire-mauve))
     (ansi-color-cyan           (:foreground moire-teal   :background moire-teal))
     (ansi-color-white          (:foreground moire-subtext :background moire-subtext))
     (ansi-color-bright-black   (:foreground moire-dirt  :background moire-dirt))
     (ansi-color-bright-red     (:foreground moire-red    :background moire-red))
     (ansi-color-bright-green   (:foreground moire-green  :background moire-green))
     (ansi-color-bright-yellow  (:foreground moire-yellow :background moire-yellow))
     (ansi-color-bright-blue    (:foreground moire-denim  :background moire-denim))
     (ansi-color-bright-magenta (:foreground moire-pink   :background moire-pink))
     (ansi-color-bright-cyan    (:foreground moire-teal   :background moire-teal))
     (ansi-color-bright-white   (:foreground moire-text :background moire-text))
     )
    ,@body))

(moire-deftheme
 moire
 "A moody pastel theme"
 ((((class color) (min-colors #xFFFFFF))
   ((class color) (min-colors #xFF)))
  (moire-dirt      "#090912"  "#000011")
  (moire-ground    "#1a1e28"  "#111122")
  (moire-floor     "#221f2a"  "#221122")
  (moire-carpet    "#1d1b26"  "#111122")
  (moire-rug       "#2d2834"  "#222233")
  (moire-linoleum  "#312e39"  "#222233")
  (moire-table     "#4c4552"  "#444444")
  (moire-desk      "#605765"  "#555555")
  (moire-sofa      "#6a5f6e"  "#665566")
  (moire-comment   "#a5899a"  "#998899")
  (moire-subtext   "#bfa1b5" "#bb99aa")
  (moire-text      "#eecde4" "#eeccdd")
  (moire-red       "#e45385" "#dd4477")
  (moire-mauve     "#d463d0" "#cc55cc")
  (moire-pink      "#f48ad4" "#ee88cc")
  (moire-peach     "#e99569" "#dd8866")
  (moire-clay      "#d9a292" "#cc9988")
  (moire-yellow    "#e7c16b" "#ddbb66")
  (moire-chartreuse "#bcbe60" "#bbbb55")
  (moire-green     "#97b664" "#88aa55")
  (moire-teal      "#6ec6a9" "#66bb99")
  (moire-denim     "#a6e5ef" "#99ddee")
  (moire-royal     "#758fc6" "#6688bb")
  (moire-blue      "#8994c1" "#8888bb")
  (moire-lavender  "#ae8cd3" "#aa88cc")
  (moire-purple    "#8e52ad" "#8844aa"))

  (custom-theme-set-variables 'moire
                              `(ansi-color-names-vector
                                [,moire-floor
                                 ,moire-red
                                 ,moire-green
                                 ,moire-yellow
                                 ,moire-blue
                                 ,moire-purple
                                 ,moire-teal
                                 ,moire-text])))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'moire)

;;; moire-theme.el ends here
