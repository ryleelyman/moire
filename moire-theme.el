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
    ((default             (:background moire-dark5 :foreground moire-light6))
     (cursor              (:background moire-red))
     (mode-line           (:background moire-dark5 :foreground moire-light4 :box nil))
     (mode-line-inactive  (:background moire-dark6 :foreground moire-light2 :box nil))
     (fringe              (:background moire-dark4))
     (hl-region           (:background moire-dark1))
     (region              (:background moire-dark2))
     (secondary-selection (:background moire-dark3))
     (minibuffer-prompt   (:foreground moire-green :bold t))
     (vertical-border     (:foreground moire-dark2))
     (internal-border     (:background moire-dark3))
     (window-divider      (:foreground moire-dark3))
     (link                (:foreground moire-royal :underline t))
     (shadow              (:foreground moire-light1))

     ;;; syntax hl

     (font-lock-builtin-face           (:foreground moire-pink))
     (font-lock-constant-face          (:foreground moire-lavender))
     (font-lock-comment-face           (:foreground moire-light1 :italic t))
     (font-lock-function-name-face     (:foreground moire-blue))
     (font-lock-function-call-face     (:foreground moire-blue))
     (font-lock-keyword-face           (:foreground moire-mauve :bold t))
     (font-lock-string-face            (:foreground moire-green))
     (font-lock-variable-name-face     (:foreground moire-pink :italic t))
     (font-lock-type-face              (:foreground moire-yellow))
     (font-lock-property-name-face     (:foreground moire-denim))
     (font-lock-property-use-face      (:foreground moire-denim))
     (font-lock-warning-face           (:foreground moire-red))

     ;;; basic faces

     (error               (:foreground moire-red :bold t :italic t))
     (success             (:foreground moire-teal :bold t :italic t))
     (warning             (:foreground moire-yellow :bold t :italic t))
     (alert-low-face      (:foreground moire-denim))
     (trailing-whitespace (:background moire-clay))
     (escape-glyph        (:foreground moire-pink))
     (header-line         (:background moire-dark3 :foreground moire-light3 :box nil :inherit nil))
     (highlight           (:background moire-dark4 :foreground moire-light6))
     (homoglyph           (:foreground moire-yellow))
     (match               (:foreground moire-light6 :background moire-indigo))

     ;;; customize

     (widget-field        (:background moire-dark3))
     (custom-group-tag    (:foreground moire-blue :weight 'bold))
     (custom-variable-tag (:foreground moire-blue :weight 'bold))

     ;;; whitespace-mode

     (whitespace-space            (:background moire-dark6 :foreground moire-dark1))
     (whitespace-hspace           (:background moire-dark6 :foreground moire-dark1))
     (whitespace-tab              (:background moire-dark6 :foreground moire-dark1))
     (whitespace-newline          (:background moire-dark5 :foreground moire-red))
     (whitespace-trailing         (:background moire-dark5 :foreground moire-red))
     (whitespace-space-before-tab (:background moire-dark6 :foreground moire-dark1))
     (whitespace-indentation      (:background moire-dark6 :foreground moire-dark1))
     (whitespace-space-after-tab  (:background moire-dark6 :foreground moire-dark1))

     ;;; line numbers

     (line-number                     (:foreground moire-light1 :background moire-dark6))
     (line-number-current-line        (:foreground moire-clay :background moire-dark6))
     (linum                           (:foreground moire-light1 :background moire-dark6))
     (linum-highlight-face            (:foreground moire-clay :background moire-dark6))
     (linum-relative-current-face     (:foreground moire-clay :background moire-dark6))

     ;;; Diffs

     (diff-header            (:background moire-dark3))
     (diff-file-header       (:background moire-dark4))
     (diff-hunk-header       (:background moire-dark2))
     (diff-context           (:background moire-dark2 :foreground moire-light2))
     (diff-added             (:background 'unspecified :foreground moire-green))
     (diff-refine-added      (:background 'unspecified :foreground moire-teal))
     (diff-removed           (:background 'unspecified :foreground moire-red))
     (diff-refine-removed    (:background 'unspecified :foreground moire-peach))
     (diff-indicator-changed (:inherit 'diff-changed))
     (diff-indicator-added   (:inherit 'diff-added))
     (diff-indicator-removed (:inherit 'diff-removed))

     ;;; popup

     (popup-face                (:underline nil :foreground moire-light5 :background moire-dark1))
     (popup-menu-mouse-face     (:underline nil :foreground moire-mauve :background moire-dark1))
     (popup-menu-selection-face (:underline nil :foregound moire-mauve :background moire-dark1))
     (popup-tip-face            (:underline nil :foregound moire-light4 :background moire-dark1))

     ;;; tooltip

     (tooltip (:foreground moire-light5 :background moire-dark1))

     ;;; corfu

     (corfu-default (:inherit 'tooltip))
     (corfu-current (:foreground moire-mauve :background moire-dark1))
     (corfu-bar (:background moire-dark2))
     (corfu-border (:background moire-dark3))

     ;;; term
     (term-color-black    (:foreground moire-light1 :background moire-dark6))
     (term-color-blue     (:foreground moire-blue :background moire-blue))
     (term-color-red      (:foreground moire-red :background moire-red))
     (term-color-cyan     (:foreground moire-teal :background moire-teal))
     (term-color-green    (:foreground moire-green :background moire-green))
     (term-color-magenta  (:foreground moire-mauve :background moire-mauve))
     (term-color-white    (:foreground moire-light6 :background moire-light6))
     (term-default-fg-color (:foreground moire-light5))
     (term-default-bg-color (:background moire-dark5))

     ;;; org-mode

     (org-hide                 (:foreground moire-light1))
     (org-level-1              (:foreground moire-pink))
     (org-level-2              (:foreground moire-mauve))
     (org-level-3              (:foreground moire-peach))
     (org-level-4              (:foreground moire-clay))
     (org-level-5              (:foreground moire-yellow))
     (org-level-6              (:foreground moire-green))
     (org-level-7              (:foreground moire-teal))
     (org-level-8              (:foreground moire-denim))
     (org-special-keyword      (:inherit 'font-lock-comment-face))
     (org-drawer               (:inherit 'font-lock-function-name-face))
     (org-column               (:background moire-dark6))
     (org-column-title         (:background moire-dark6 :underline t :weight 'bold))
     (org-warning              (:foreground moire-red :weight 'bold :underline nil))
     (org-archived             (:foreground moire-light1 :weight 'bold))
     (org-link                 (:inherit 'link))
     (org-footnote             (:foreground moire-teal :underline t))
     (org-ellipsis             (:foreground moire-light2))
     (org-date                 (:foreground moire-blue :underline t))
     (org-sexp-date            (:foreground moire-blue :underline t))
     (org-tag                  (:weight 'bold))
     (org-list-dt              (:weight 'bold))
     (org-todo                 (:foreground moire-red :weight 'bold))
     (org-done                 (:foreground moire-teal :weight 'bold))
     (org-agenda-done          (:foreground moire-teal))
     (org-headline-done        (:foreground moire-teal))
     (org-table                (:foreground moire-blue))
     (org-block                (:background moire-dark6))
     (org-block-begin-line     (:background moire-dark5))
     (org-block-end-line       (:background moire-dark5))
     (org-document-info        (:foreground moire-blue))
     (org-document-title       (:foreground moire-blue))
     (org-agenda-structure     (:inherit 'font-lock-comment-face))
     (org-agenda-date-today    (:foreground moire-light6 :weight 'bold :slant 'italic))
     (org-scheduled            (:foreground moire-yellow))
     (org-scheduled-today      (:foreground moire-denim))
     (org-scheduled-previously (:foreground moire-peach))
     (org-upcoming-deadline    (:inherit 'font-lock-keyword-face))
     (org-deadline-announce    (:foreground moire-peach))
     (org-time-grid            (:foreground moire-clay))
     (org-latex-and-related    (:foreground moire-blue))

     ;;; show-paren

     (show-paren-match    (:background moire-dark3 :foreground moire-blue :weight 'bold))
     (show-paren-mismatch (:background moire-red :foreground moire-dark3 :weight 'bold))

     ;;; orderless

     (orderless-match-face-0 (:foreground moire-yellow))
     (orderless-match-face-1 (:foreground moire-clay))
     (orderless-match-face-2 (:foreground moire-blue))
     (orderless-match-face-3 (:foreground moire-purple))

     ;;; magit

     (magit-bisect-bad                          (:foreground moire-red))
     (magit-bisect-good                         (:foreground moire-green))
     (magit-bisect-skip                         (:foreground moire-clay))
     (magit-blame-heading                       (:foreground moire-light6 :background moire-dark6))
     (magit-branch-local                        (:foreground moire-blue))
     (magit-branch-current                      (:underline moire-denim :inherit 'magit-branch-local))
     (magit-branch-remote                       (:foreground moire-green))
     (magit-cherry-equivalent                   (:foreground moire-lavender))
     (magit-cherry-unmatched                    (:foreground moire-teal))
     (magit-diff-added                          (:foreground moire-green))
     (magit-diff-added-highlight                (:foreground moire-green :inherit 'magit-diff-context-highlight))
     (magit-diff-base                           (:background moire-dark1 :foreground moire-light6))
     (magit-diff-base-highlight                 (:background moire-dark1 :foreground moire-light6))
     (magit-diff-context                        (:background moire-dark4  :foreground moire-light5))
     (magit-diff-context-highlight              (:background moire-dark4 :foreground moire-light6))
     (magit-diff-hunk-heading                   (:background moire-dark5 :foreground moire-light5))
     (magit-diff-hunk-heading-highlight         (:background moire-dark5 :foreground moire-light6))
     (magit-diff-hunk-heading-selection         (:background moire-dark3 :foreground moire-peach))
     (magit-diff-lines-heading                  (:background moire-dark3 :foreground moire-light6))
     (magit-diff-removed                        (:foreground moire-red))
     (magit-diff-removed-highlight              (:foreground moire-red :inherit 'magit-diff-context-highlight))
     (magit-diffstat-added                      (:foreground moire-green))
     (magit-diffstat-removed                    (:foreground moire-red))
     (magit-dimmed                              (:foreground moire-light4))
     (magit-hash                                (:foreground moire-denim))
     (magit-log-author                          (:foreground moire-mauve))
     (magit-log-date                            (:foreground moire-teal))
     (magit-log-graph                           (:foreground moire-light4))
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
     (magit-refname                             (:foreground moire-light4))
     (magit-section-heading                     (:foreground moire-yellow :weight 'bold))
     (magit-section-heading-selection           (:foreground moire-clay))
     (magit-section-highlight                   (:background moire-dark3))
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

     ;;; git gutter

     (git-gutter:modified (:background moire-clay :foreground moire-clay))
     (git-gutter:added    (:background moire-green :foreground moire-green))
     (git-gutter:deleted  (:background moire-red :foreground moire-red))

     (git-gutter-fr:modified (:inherit 'git-gutter:modified))
     (git-gutter-fr:added (:inherit 'git-gutter:added))
     (git-gutter-fr:deleted (:inherit 'git-gutter:deleted))

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
     (font-latex-sedate-face       (:foreground moire-light5))
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
     (widget-field               (:foreground moire-light6 :background moire-dark3))
     (widget-single-line-field   (:foreground moire-light6 :background moire-dark3))

     ;;; eshell

     (eshell-prompt                              (:foreground moire-teal))
     (eshell-ls-archive                          (:foreground moire-light4))
     (eshell-ls-backup                           (:foreground moire-light3))
     (eshell-ls-clutter                          (:foreground moire-clay :weight 'bold))
     (eshell-ls-directory                        (:foreground moire-yellow))
     (eshell-ls-executable                       (:weight 'bold))
     (eshell-ls-missing                          (:foreground moire-red :bold t))
     (eshell-ls-product                          (:foreground moire-peach))
     (eshell-ls-readonly                         (:foreground moire-light2))
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

     (vertico-posframe            (:background moire-dark6))
     (vertico-posframe-border     (:background moire-dark5))
     (vertico-posframe-border-2   (:background moire-dark4))
     (vertico-posframe-border-3   (:background moire-dark3))
     (vertico-posframe-border-4   (:background moire-dark2))

     ;;; ansi-color

     (ansi-color-black          (:foreground moire-dark5  :background moire-dark5))
     (ansi-color-red            (:foreground moire-peach  :background moire-peach))
     (ansi-color-green          (:foreground moire-green  :background moire-green))
     (ansi-color-yellow         (:foreground moire-clay   :background moire-clay))
     (ansi-color-blue           (:foreground moire-royal  :background moire-royal))
     (ansi-color-magenta        (:foreground moire-mauve  :background moire-mauve))
     (ansi-color-cyan           (:foreground moire-teal   :background moire-teal))
     (ansi-color-white          (:foreground moire-light5 :background moire-light5))
     (ansi-color-bright-black   (:foreground moire-dark6  :background moire-dark6))
     (ansi-color-bright-red     (:foreground moire-red    :background moire-red))
     (ansi-color-bright-green   (:foreground moire-green  :background moire-green))
     (ansi-color-bright-yellow  (:foreground moire-yellow :background moire-yellow))
     (ansi-color-bright-blue    (:foreground moire-denim  :background moire-denim))
     (ansi-color-bright-magenta (:foreground moire-pink   :background moire-pink))
     (ansi-color-bright-cyan    (:foreground moire-teal   :background moire-teal))
     (ansi-color-bright-white   (:foreground moire-light6 :background moire-light6))
     )
    ,@body))

(moire-deftheme
 moire
 "A moody pastel theme"
 ((((class color) (min-colors #xFFFFFF))
   ((class color) (min-colors #xFF)))
  (moire-dark6      "#191922"  "#111122")
  (moire-dark5      "#1a1e28"  "#111122")
  (moire-dark4      "#23242f"  "#222222")
  (moire-dark3      "#2f2c28"  "#222222")
  (moire-dark2      "#35332d"  "#333322")
  (moire-dark1      "#47413b"  "#443333")
  (moire-light1     "#786569"  "#775566")
  (moire-light2     "#6c5a5f"  "#665555")
  (moire-light3     "#86727a"  "#776677")
  (moire-light4     "#a5899a"  "#998899")
  (moire-light5     "#bfa1b5" "#bb99aa")
  (moire-light6     "#eecde4" "#eeccdd")
  (moire-red        "#e1346d" "#dd3366")
  (moire-mauve      "#cf50cc" "#cc44cc")
  (moire-pink       "#f57ed1" "#ee77cc")
  (moire-peach      "#e88b53" "#dd8844")
  (moire-clay       "#d59b84" "#cc9977")
  (moire-yellow     "#e6bf56" "#ddbb55")
  (moire-green      "#90ba56" "#88aa55")
  (moire-teal       "#60cca7" "#55cc99")
  (moire-denim      "#a2f1f9" "#99eeee")
  (moire-royal      "#758fc6" "#6688bb")
  (moire-blue       "#8070fd" "#7766ee")
  (moire-indigo     "#615dbb" "#5555bb")
  (moire-lavender   "#ab88d8" "#aa88cc")
  (moire-purple     "#8544ac" "#7744aa"))

  (custom-theme-set-variables 'moire
                              `(ansi-color-names-vector
                                [,moire-dark6
                                 ,moire-red
                                 ,moire-green
                                 ,moire-yellow
                                 ,moire-blue
                                 ,moire-purple
                                 ,moire-teal
                                 ,moire-light1])))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'moire)

;;; moire-theme.el ends here
