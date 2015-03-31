;;; easster-theme.el --- An easter pastel color theme for Emacs.

;; Copyright (C) 2015 Christian E. Hopps
;; Copyright (C) 2011-2014 Bozhidar Batsov

;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://github.com/bbatsov/easter-emacs
;; Version: 20141112.923
;; X-Original-Version: 2.3-cvs

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is a port of easter-theme, replacing the colors with easter
;; themed pastels.

;;; Credits:

;; Bozhidar Batsov created the easter-theme for emacs on such this port
;; is based.
;; Jani Nurminen created the original theme for vim on such this port
;; is based.

;;; Code:

(deftheme easter "The Easter color theme")

;;; Color Palette

(defvar easter-colors-alist
  '(("easter-fg+1"     . "#FFFFEF")
    ("easter-fg+05"    . "#EAEAEA")
    ("easter-fg"       . "#DCDCDC")
    ("easter-fg-1"     . "#D0D0C0")
    ("easter-bg-2"     . "#000000")
    ("easter-bg-1"     . "#1f1f1f")
    ("easter-bg-05"    . "#202020")
    ("easter-bg"     . "#002b36")
    ; ("easter-bg"     . "#2f2f2f")
    ("easter-bg+05"    . "#494949")
    ("easter-bg+1"     . "#4F4F4F")
    ("easter-bg+2"     . "#5F5F5F")
    ("easter-bg+3"     . "#6F6F6F")
    ("easter-red+1"    . "#FFC0CB")
    ("easter-red"      . "#F0B4BF")
    ("easter-red-1"    . "#E1A9B3")
    ("easter-red-2"    . "#D29DA7")
    ("easter-red-3"    . "#C3929B")
    ("easter-red-4"    . "#B3878F")
    ("easter-orange"   . "#FFA07A")
    ("easter-yellow"   . "#F8FBA3")
    ("easter-yellow-1" . "#FFFF66")
    ("easter-yellow-2" . "#FFF700")
    ("easter-green-1"  . "#00DD6e")
    ("easter-green"    . "#25e380")
    ("easter-green+1"  . "#4be992")
    ("easter-green+2"  . "#71efa4")
    ("easter-green+3"  . "#97f5b6")
    ("easter-green+4"  . "#bdfcc9")
    ("easter-cyan"     . "#93E0E3")
    ("easter-blue+1"   . "#dee5fe")
    ("easter-blue"     . "#b9d8ec")
    ("easter-blue-1"   . "#94cbdb")
    ("easter-blue-2"   . "#6fbeca")
    ("easter-blue-3"   . "#4ab1b9")
    ("easter-blue-4"   . "#25a4a8")
    ("easter-blue-5"   . "#009797")
    ("easter-violet"  . "#DDA0DD"))
  "List of Easter colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro easter-with-color-variables (&rest body)
  "`let' bind all colors defined in `easter-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   easter-colors-alist))
     ,@body))

;;; Theme Faces
(easter-with-color-variables
  (custom-theme-set-faces
   'easter
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,easter-blue-2 :underline t :weight bold))))
   `(link-visited ((t (:foreground ,easter-red :underline t :weight normal))))
   `(default ((t (:foreground ,easter-fg :background ,easter-bg))))
   `(cursor ((t (:foreground ,easter-fg :background ,easter-fg+1))))
   `(escape-glyph ((t (:foreground ,easter-yellow :bold t))))
   `(fringe ((t (:foreground ,easter-fg :background ,easter-bg+1))))
   `(header-line ((t (:foreground ,easter-yellow
                                  :background ,easter-bg-1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:foreground ,easter-bg-2 :background ,easter-violet))))
   `(success ((t (:foreground ,easter-green :weight bold))))
   `(warning ((t (:foreground ,easter-orange :weight bold))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,easter-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,easter-green))))
   `(compilation-error-face ((t (:foreground ,easter-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,easter-fg))))
   `(compilation-info-face ((t (:foreground ,easter-blue))))
   `(compilation-info ((t (:foreground ,easter-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,easter-green))))
   `(compilation-line-face ((t (:foreground ,easter-yellow))))
   `(compilation-line-number ((t (:foreground ,easter-yellow))))
   `(compilation-message-face ((t (:foreground ,easter-blue))))
   `(compilation-warning-face ((t (:foreground ,easter-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,easter-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,easter-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,easter-yellow :weight bold))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,easter-fg))))
   `(grep-error-face ((t (:foreground ,easter-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,easter-blue))))
   `(grep-match-face ((t (:foreground ,easter-orange :weight bold))))
   `(match ((t (:background ,easter-bg-1 :foreground ,easter-orange :weight bold))))
;;;;; isearch
   `(isearch ((t (:foreground ,easter-yellow-2 :weight bold :background ,easter-bg+2))))
   `(isearch-fail ((t (:foreground ,easter-fg :background ,easter-red-4))))
   `(lazy-highlight ((t (:foreground ,easter-yellow-2 :weight bold :background ,easter-bg-05))))

   `(menu ((t (:foreground ,easter-fg :background ,easter-bg))))
   `(minibuffer-prompt ((t (:foreground ,easter-yellow))))
   `(mode-line
     ((,class (:foreground ,easter-green+1
                           :background ,easter-bg-1
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,easter-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,easter-green-1
                      :background ,easter-bg-05
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,easter-bg-1))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,easter-bg+2))))
   `(trailing-whitespace ((t (:background ,easter-red))))
   `(vertical-border ((t (:foreground ,easter-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,easter-fg+05 :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,easter-red+1 :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,easter-red+1 :slant italic))))
   `(font-lock-constant-face ((t (:foreground ,easter-green+4))))
   `(font-lock-doc-face ((t (:foreground ,easter-green+2))))
   `(font-lock-function-name-face ((t (:foreground ,easter-blue))))
   `(font-lock-keyword-face ((t (:foreground ,easter-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,easter-yellow-1 :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,easter-blue))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,easter-yellow-1 :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,easter-red :weight bold))))
   `(font-lock-string-face ((t (:foreground ,easter-green))))
   `(font-lock-type-face ((t (:foreground ,easter-blue-2))))
   `(font-lock-variable-name-face ((t (:foreground ,easter-blue-1))))
   `(font-lock-warning-face ((t (:foreground ,easter-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,easter-fg))))
   `(newsticker-default-face ((t (:foreground ,easter-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,easter-green+3))))
   `(newsticker-extra-face ((t (:foreground ,easter-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,easter-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,easter-green))))
   `(newsticker-new-item-face ((t (:foreground ,easter-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,easter-red))))
   `(newsticker-old-item-face ((t (:foreground ,easter-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,easter-fg))))
   `(newsticker-treeview-face ((t (:foreground ,easter-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,easter-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,easter-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,easter-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,easter-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,easter-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,easter-bg-1 :foreground ,easter-yellow))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,easter-fg-1 :background ,easter-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,easter-green+2 :background ,easter-bg :inverse-video nil))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,easter-green+1))))
   `(android-mode-error-face ((t (:foreground ,easter-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,easter-fg))))
   `(android-mode-verbose-face ((t (:foreground ,easter-green))))
   `(android-mode-warning-face ((t (:foreground ,easter-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,easter-cyan :weight bold))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,easter-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,easter-yellow))))
   `(font-latex-italic-face ((t (:foreground ,easter-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,easter-orange))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,easter-bg+3 :foreground ,easter-bg-2))))
   `(ac-selection-face ((t (:background ,easter-blue-4 :foreground ,easter-fg))))
   `(popup-tip-face ((t (:background ,easter-yellow-2 :foreground ,easter-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,easter-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,easter-bg-1))))
   `(popup-isearch-match ((t (:background ,easter-bg :foreground ,easter-fg))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,easter-fg :background ,easter-bg+1))))
   `(company-tooltip-selection ((t (:foreground ,easter-fg :background ,easter-bg-1))))
   `(company-tooltip-mouse ((t (:background ,easter-bg-1))))
   `(company-tooltip-common ((t (:foreground ,easter-green+2))))
   `(company-tooltip-common-selection ((t (:foreground ,easter-green+2))))
   `(company-scrollbar-fg ((t (:background ,easter-bg-1))))
   `(company-scrollbar-bg ((t (:background ,easter-bg+2))))
   `(company-preview ((t (:background ,easter-green+2))))
   `(company-preview-common ((t (:foreground ,easter-green+2 :background ,easter-bg-1))))
;;;;; bm
   `(bm-face ((t (:background ,easter-yellow-1 :foreground ,easter-bg))))
   `(bm-fringe-face ((t (:background ,easter-yellow-1 :foreground ,easter-bg))))
   `(bm-fringe-persistent-face ((t (:background ,easter-green-1 :foreground ,easter-bg))))
   `(bm-persistent-face ((t (:background ,easter-green-1 :foreground ,easter-bg))))
;;;;; clojure-test-mode
   `(clojure-test-failure-face ((t (:foreground ,easter-orange :weight bold :underline t))))
   `(clojure-test-error-face ((t (:foreground ,easter-red :weight bold :underline t))))
   `(clojure-test-success-face ((t (:foreground ,easter-green+1 :weight bold :underline t))))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,easter-blue :foreground ,easter-bg))))
   `(ctbl:face-continue-bar ((t (:background ,easter-bg-05 :foreground ,easter-bg))))
   `(ctbl:face-row-select ((t (:background ,easter-cyan :foreground ,easter-bg))))
;;;;; diff
   `(diff-added ((,class (:foreground ,easter-green+4 :background nil))
                 (t (:foreground ,easter-green-1 :background nil))))
   `(diff-changed ((t (:foreground ,easter-yellow))))
   `(diff-removed ((,class (:foreground ,easter-red :background nil))
                   (t (:foreground ,easter-red-3 :background nil))))
   `(diff-refine-added ((t (:inherit diff-added :weight bold))))
   `(diff-refine-change ((t (:inherit diff-changed :weight bold))))
   `(diff-refine-removed ((t (:inherit diff-removed :weight bold))))
   `(diff-header ((,class (:background ,easter-bg+2))
                  (t (:background ,easter-fg :foreground ,easter-bg))))
   `(diff-file-header
     ((,class (:background ,easter-bg+2 :foreground ,easter-fg :bold t))
      (t (:background ,easter-fg :foreground ,easter-bg :bold t))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,easter-blue-2 :background ,easter-bg-05))))
   `(diff-hl-delete ((,class (:foreground ,easter-red+1 :background ,easter-bg-05))))
   `(diff-hl-insert ((,class (:foreground ,easter-green+1 :background ,easter-bg-05))))
   `(diff-hl-unknown ((,class (:foreground ,easter-yellow :background ,easter-bg-05))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,easter-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,easter-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,easter-orange))))
   `(diredp-date-time ((t (:foreground ,easter-violet))))
   `(diredp-deletion ((t (:foreground ,easter-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,easter-red))))
   `(diredp-dir-heading ((t (:foreground ,easter-blue :background ,easter-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,easter-cyan))))
   `(diredp-exec-priv ((t (:foreground ,easter-red))))
   `(diredp-executable-tag ((t (:foreground ,easter-green+1))))
   `(diredp-file-name ((t (:foreground ,easter-blue))))
   `(diredp-file-suffix ((t (:foreground ,easter-green))))
   `(diredp-flag-mark ((t (:foreground ,easter-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,easter-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,easter-red))))
   `(diredp-link-priv ((t (:foreground ,easter-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,easter-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,easter-orange))))
   `(diredp-no-priv ((t (:foreground ,easter-fg))))
   `(diredp-number ((t (:foreground ,easter-green+1))))
   `(diredp-other-priv ((t (:foreground ,easter-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,easter-red-1))))
   `(diredp-read-priv ((t (:foreground ,easter-green-1))))
   `(diredp-symlink ((t (:foreground ,easter-yellow))))
   `(diredp-write-priv ((t (:foreground ,easter-violet))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,easter-fg :background ,easter-red-4))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,easter-fg :background ,easter-red-4))))
   `(ediff-current-diff-B ((t (:foreground ,easter-fg :background ,easter-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,easter-fg :background ,easter-blue-5))))
   `(ediff-even-diff-A ((t (:background ,easter-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,easter-bg+1))))
   `(ediff-even-diff-B ((t (:background ,easter-bg+1))))
   `(ediff-even-diff-C ((t (:background ,easter-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,easter-fg :background ,easter-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,easter-fg :background ,easter-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,easter-fg :background ,easter-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,easter-fg :background ,easter-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,easter-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,easter-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,easter-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,easter-bg+2))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,easter-fg))))
   `(egg-help-header-1 ((t (:foreground ,easter-yellow))))
   `(egg-help-header-2 ((t (:foreground ,easter-green+3))))
   `(egg-branch ((t (:foreground ,easter-yellow))))
   `(egg-branch-mono ((t (:foreground ,easter-yellow))))
   `(egg-term ((t (:foreground ,easter-yellow))))
   `(egg-diff-add ((t (:foreground ,easter-green+4))))
   `(egg-diff-del ((t (:foreground ,easter-red+1))))
   `(egg-diff-file-header ((t (:foreground ,easter-yellow-2))))
   `(egg-section-title ((t (:foreground ,easter-yellow))))
   `(egg-stash-mono ((t (:foreground ,easter-green+4))))
;;;;; elfeed
   `(elfeed-search-date-face ((t (:foreground ,easter-yellow-1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,easter-green))))
   `(elfeed-search-feed-face ((t (:foreground ,easter-cyan))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,easter-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,easter-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,easter-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,easter-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,easter-green+2 :background ,easter-bg))))
   `(w3m-lnum-match ((t (:background ,easter-bg-1
                                     :foreground ,easter-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,easter-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,easter-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,easter-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,easter-yellow))))
   `(erc-keyword-face ((t (:foreground ,easter-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,easter-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,easter-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default))))
   `(erc-notice-face ((t (:foreground ,easter-green))))
   `(erc-pal-face ((t (:foreground ,easter-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,easter-orange :background ,easter-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,easter-green+4))))
   `(erc-underline-face ((t (:underline t))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,easter-green+4 :background ,easter-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,easter-red :background ,easter-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,easter-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,easter-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,easter-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,easter-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,easter-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,easter-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,easter-cyan :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,easter-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-red-1) :inherit unspecified))
      (t (:foreground ,easter-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-yellow) :inherit unspecified))
      (t (:foreground ,easter-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-cyan) :inherit unspecified))
      (t (:foreground ,easter-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,easter-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,easter-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,easter-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,easter-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,easter-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,easter-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-orange) :inherit unspecified))
      (t (:foreground ,easter-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-red) :inherit unspecified))
      (t (:foreground ,easter-red-1 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,easter-fg))))
   `(ack-file ((t (:foreground ,easter-blue))))
   `(ack-line ((t (:foreground ,easter-yellow))))
   `(ack-match ((t (:foreground ,easter-orange :background ,easter-bg-1 :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,easter-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,easter-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,easter-violet :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,easter-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,easter-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,easter-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,easter-violet :weight bold))))
;;;;; git-rebase-mode
   `(git-rebase-hash ((t (:foreground, easter-orange))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-from))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((t (:foreground ,easter-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,easter-blue))))
   `(gnus-summary-high-read ((t (:foreground ,easter-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,easter-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,easter-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,easter-blue))))
   `(gnus-summary-low-read ((t (:foreground ,easter-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,easter-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,easter-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,easter-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,easter-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,easter-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,easter-fg))))
   `(gnus-summary-selected ((t (:foreground ,easter-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,easter-blue))))
   `(gnus-cite-10 ((t (:foreground ,easter-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,easter-yellow))))
   `(gnus-cite-2 ((t (:foreground ,easter-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,easter-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,easter-green+2))))
   `(gnus-cite-5 ((t (:foreground ,easter-green+1))))
   `(gnus-cite-6 ((t (:foreground ,easter-green))))
   `(gnus-cite-7 ((t (:foreground ,easter-red))))
   `(gnus-cite-8 ((t (:foreground ,easter-red-1))))
   `(gnus-cite-9 ((t (:foreground ,easter-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,easter-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,easter-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,easter-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,easter-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,easter-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,easter-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,easter-bg+2))))
   `(gnus-signature ((t (:foreground ,easter-yellow))))
   `(gnus-x ((t (:background ,easter-fg :foreground ,easter-bg))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,easter-blue))))
   `(guide-key/key-face ((t (:foreground ,easter-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,easter-green+1))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,easter-green
                      :background ,easter-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,easter-yellow
                      :background ,easter-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,easter-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,easter-bg+1))))
   `(helm-visible-mark ((t (:foreground ,easter-bg :background ,easter-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,easter-green+4 :background ,easter-bg-1))))
   `(helm-separator ((t (:foreground ,easter-red :background ,easter-bg))))
   `(helm-time-zone-current ((t (:foreground ,easter-green+2 :background ,easter-bg))))
   `(helm-time-zone-home ((t (:foreground ,easter-red :background ,easter-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,easter-orange :background ,easter-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,easter-violet :background ,easter-bg))))
   `(helm-bookmark-info ((t (:foreground ,easter-green+2 :background ,easter-bg))))
   `(helm-bookmark-man ((t (:foreground ,easter-yellow :background ,easter-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,easter-violet :background ,easter-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,easter-red :background ,easter-bg))))
   `(helm-buffer-process ((t (:foreground ,easter-cyan :background ,easter-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,easter-fg :background ,easter-bg))))
   `(helm-buffer-size ((t (:foreground ,easter-fg-1 :background ,easter-bg))))
   `(helm-ff-directory ((t (:foreground ,easter-cyan :background ,easter-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,easter-fg :background ,easter-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,easter-green+2 :background ,easter-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,easter-red :background ,easter-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,easter-yellow :background ,easter-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,easter-bg :background ,easter-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,easter-cyan :background ,easter-bg))))
   `(helm-grep-file ((t (:foreground ,easter-fg :background ,easter-bg))))
   `(helm-grep-finish ((t (:foreground ,easter-green+2 :background ,easter-bg))))
   `(helm-grep-lineno ((t (:foreground ,easter-fg-1 :background ,easter-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,easter-red :background ,easter-bg))))
   `(helm-moccur-buffer ((t (:foreground ,easter-cyan :background ,easter-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,easter-fg-1 :background ,easter-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,easter-fg :background ,easter-bg))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,easter-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,easter-bg-05)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,easter-bg+1))
                   (t :weight bold)))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,easter-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,easter-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,easter-yellow))))
   `(ido-indicator ((t (:foreground ,easter-yellow :background ,easter-red-4))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,easter-bg+2 :weight bold))))
;;;;; irfc-mode
   `(irfc-head-name-face ((t (:foreground ,easter-orange))))
   `(irfc-head-number-face ((t (:foreground ,easter-orange))))
   `(irfc-reference-face ((t (:foreground ,easter-yellow-2 :underline t))))
   `(irfc-requirement-keyword-face ((t (:bold t :italic t :slant italic :weight bold))))
   `(irfc-rfc-link-face ((t (:foreground ,easter-yellow-2 :underline t))))
   `(irfc-rfc-number-face ((t (:bold t :weight bold))))
   `(irfc-std-number-face ((t (:bold t :weight bold))))
   `(irfc-table-item-face ((t (:foreground ,easter-yellow-2 :underline t))))
   `(irfc-title-face ((t (:foreground ,easter-orange))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,easter-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,easter-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,easter-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,easter-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,easter-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,easter-red+1))))
   `(jabber-activity-face((t (:foreground ,easter-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,easter-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,easter-orange))))
   `(js2-error ((t (:foreground ,easter-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,easter-green-1))))
   `(js2-jsdoc-type ((t (:foreground ,easter-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,easter-green+3))))
   `(js2-function-param ((t (:foreground, easter-green+3))))
   `(js2-external-variable ((t (:foreground ,easter-orange))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,easter-red-1 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,easter-fg :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,easter-bg+1))))
   `(ledger-font-pending-face ((t (:foreground ,easter-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,easter-fg))))
   `(ledger-font-posting-account-face ((t (:foreground ,easter-blue-1))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,easter-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,easter-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,easter-orange))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,easter-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,easter-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,easter-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,easter-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,easter-red-1 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,easter-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,easter-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,easter-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,easter-green+2 :background ,easter-bg))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,easter-green+2 :background ,easter-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,easter-red+1 :background ,easter-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,easter-blue+1 :background ,easter-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,easter-violet :background ,easter-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,easter-yellow :background ,easter-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
   `(magit-item-highlight ((t (:background ,easter-bg+05))))
   `(magit-section-title ((t (:foreground ,easter-yellow :weight bold))))
   `(magit-process-ok ((t (:foreground ,easter-green :weight bold))))
   `(magit-process-ng ((t (:foreground ,easter-red :weight bold))))
   `(magit-branch ((t (:foreground ,easter-blue :weight bold))))
   `(magit-log-author ((t (:foreground ,easter-orange))))
   `(magit-log-sha1 ((t (:foreground, easter-orange))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,easter-green+1))))
   `(message-header-other ((t (:foreground ,easter-green))))
   `(message-header-to ((t (:foreground ,easter-yellow :weight bold))))
   `(message-header-from ((t (:foreground ,easter-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,easter-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,easter-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,easter-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,easter-green))))
   `(message-mml ((t (:foreground ,easter-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,easter-orange))))
   `(mew-face-header-from ((t (:foreground ,easter-yellow))))
   `(mew-face-header-date ((t (:foreground ,easter-green))))
   `(mew-face-header-to ((t (:foreground ,easter-red))))
   `(mew-face-header-key ((t (:foreground ,easter-green))))
   `(mew-face-header-private ((t (:foreground ,easter-green))))
   `(mew-face-header-important ((t (:foreground ,easter-blue))))
   `(mew-face-header-marginal ((t (:foreground ,easter-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,easter-red))))
   `(mew-face-header-xmew ((t (:foreground ,easter-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,easter-red))))
   `(mew-face-body-url ((t (:foreground ,easter-orange))))
   `(mew-face-body-comment ((t (:foreground ,easter-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,easter-green))))
   `(mew-face-body-cite2 ((t (:foreground ,easter-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,easter-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,easter-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,easter-red))))
   `(mew-face-mark-review ((t (:foreground ,easter-blue))))
   `(mew-face-mark-escape ((t (:foreground ,easter-green))))
   `(mew-face-mark-delete ((t (:foreground ,easter-red))))
   `(mew-face-mark-unlink ((t (:foreground ,easter-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,easter-green))))
   `(mew-face-mark-unread ((t (:foreground ,easter-red-2))))
   `(mew-face-eof-message ((t (:foreground ,easter-green))))
   `(mew-face-eof-part ((t (:foreground ,easter-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,easter-cyan :background ,easter-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,easter-bg :background ,easter-violet :weight bold))))
   `(paren-face-no-match ((t (:foreground ,easter-bg :background ,easter-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,easter-blue))))
   `(mingus-pausing-face ((t (:foreground ,easter-violet))))
   `(mingus-playing-face ((t (:foreground ,easter-cyan))))
   `(mingus-playlist-face ((t (:foreground ,easter-cyan ))))
   `(mingus-song-file-face ((t (:foreground ,easter-yellow))))
   `(mingus-stopped-face ((t (:foreground ,easter-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,easter-yellow))))
   `(nav-face-button-num ((t (:foreground ,easter-cyan))))
   `(nav-face-dir ((t (:foreground ,easter-green))))
   `(nav-face-hdir ((t (:foreground ,easter-red))))
   `(nav-face-file ((t (:foreground ,easter-fg))))
   `(nav-face-hfile ((t (:foreground ,easter-red-4))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,easter-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,easter-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,easter-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,easter-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,easter-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,easter-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,easter-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,easter-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,easter-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,easter-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,easter-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,easter-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,easter-bg+1))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,easter-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,easter-fg :weight bold))))
   `(org-checkbox ((t (:background ,easter-bg+2 :foreground ,easter-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,easter-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,easter-red-1))))
   `(org-done ((t (:bold t :weight bold :foreground ,easter-green+3))))
   `(org-formula ((t (:foreground ,easter-yellow-2))))
   `(org-headline-done ((t (:foreground ,easter-green+3))))
   `(org-hide ((t (:foreground ,easter-bg-1))))
   `(org-level-1 ((t (:foreground ,easter-orange))))
   `(org-level-2 ((t (:foreground ,easter-green+4))))
   `(org-level-3 ((t (:foreground ,easter-blue-1))))
   `(org-level-4 ((t (:foreground ,easter-yellow-2))))
   `(org-level-5 ((t (:foreground ,easter-cyan))))
   `(org-level-6 ((t (:foreground ,easter-green+2))))
   `(org-level-7 ((t (:foreground ,easter-red-4))))
   `(org-level-8 ((t (:foreground ,easter-blue-4))))
   `(org-link ((t (:foreground ,easter-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,easter-green+4))))
   `(org-scheduled-previously ((t (:foreground ,easter-red))))
   `(org-scheduled-today ((t (:foreground ,easter-blue+1))))
   `(org-sexp-date ((t (:foreground ,easter-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,easter-green+2))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,easter-orange))))
   `(org-todo ((t (:bold t :foreground ,easter-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,easter-red :weight bold :underline nil))))
   `(org-column ((t (:background ,easter-bg-1))))
   `(org-column-title ((t (:background ,easter-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,easter-fg :background ,easter-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,easter-bg :background ,easter-red-1))))
   `(org-ellipsis ((t (:foreground ,easter-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,easter-cyan :underline t))))
;;;;; outline
   `(outline-1 ((t (:foreground ,easter-orange))))
   `(outline-2 ((t (:foreground ,easter-green+4))))
   `(outline-3 ((t (:foreground ,easter-blue-1))))
   `(outline-4 ((t (:foreground ,easter-yellow-2))))
   `(outline-5 ((t (:foreground ,easter-cyan))))
   `(outline-6 ((t (:foreground ,easter-green+2))))
   `(outline-7 ((t (:foreground ,easter-red-4))))
   `(outline-8 ((t (:foreground ,easter-blue-4))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,easter-yellow-2 :inherit mode-line))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,easter-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,easter-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,easter-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,easter-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,easter-fg :background ,easter-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,easter-bg :background ,easter-orange))))
   `(proof-error-face ((t (:foreground ,easter-fg :background ,easter-red-4))))
   `(proof-highlight-dependency-face ((t (:foreground ,easter-bg :background ,easter-yellow-1))))
   `(proof-highlight-dependent-face ((t (:foreground ,easter-bg :background ,easter-orange))))
   `(proof-locked-face ((t (:background ,easter-blue-5))))
   `(proof-mouse-highlight-face ((t (:foreground ,easter-bg :background ,easter-orange))))
   `(proof-queue-face ((t (:background ,easter-red-4))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,easter-red-2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,easter-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,easter-bg))))
   `(proof-warning-face ((t (:foreground ,easter-bg :background ,easter-yellow-1))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,easter-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,easter-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,easter-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,easter-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,easter-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,easter-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,easter-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,easter-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,easter-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,easter-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,easter-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,easter-blue-5))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,easter-blue))))
   `(rcirc-other-nick ((t (:foreground ,easter-orange))))
   `(rcirc-bright-nick ((t (:foreground ,easter-blue+1))))
   `(rcirc-dim-nick ((t (:foreground ,easter-blue-2))))
   `(rcirc-server ((t (:foreground ,easter-green))))
   `(rcirc-server-prefix ((t (:foreground ,easter-green+1))))
   `(rcirc-timestamp ((t (:foreground ,easter-green+2))))
   `(rcirc-nick-in-message ((t (:foreground ,easter-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:bold t))))
   `(rcirc-prompt ((t (:foreground ,easter-yellow :bold t))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:bold t))))
   `(rcirc-url ((t (:bold t))))
   `(rcirc-keyword ((t (:foreground ,easter-yellow :bold t))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,easter-green))))
   `(rpm-spec-doc-face ((t (:foreground ,easter-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,easter-red))))
   `(rpm-spec-macro-face ((t (:foreground ,easter-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,easter-red))))
   `(rpm-spec-package-face ((t (:foreground ,easter-red))))
   `(rpm-spec-section-face ((t (:foreground ,easter-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,easter-blue))))
   `(rpm-spec-var-face ((t (:foreground ,easter-red))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,easter-orange))))
   `(rst-level-2-face ((t (:foreground ,easter-green+1))))
   `(rst-level-3-face ((t (:foreground ,easter-blue-1))))
   `(rst-level-4-face ((t (:foreground ,easter-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,easter-cyan))))
   `(rst-level-6-face ((t (:foreground ,easter-green-1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,easter-yellow :bold t))))
   `(sh-quoted-exec ((t (:foreground ,easter-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,easter-red+1 :background ,easter-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,easter-bg+3 :weight bold))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,easter-red+1 :background ,easter-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,easter-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,easter-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,easter-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-red)))
      (t
       (:underline ,easter-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-orange)))
      (t
       (:underline ,easter-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-yellow)))
      (t
       (:underline ,easter-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,easter-green)))
      (t
       (:underline ,easter-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,easter-green+2))))
   `(speedbar-directory-face ((t (:foreground ,easter-cyan))))
   `(speedbar-file-face ((t (:foreground ,easter-fg))))
   `(speedbar-highlight-face ((t (:foreground ,easter-bg :background ,easter-green+2))))
   `(speedbar-selected-face ((t (:foreground ,easter-red))))
   `(speedbar-separator-face ((t (:foreground ,easter-bg :background ,easter-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,easter-yellow))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,easter-fg
                                    :background ,easter-bg))))
   `(tabbar-selected ((t (:foreground ,easter-fg
                                      :background ,easter-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,easter-fg
                                        :background ,easter-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,easter-bg
                                       :background ,easter-bg-1))))
   `(term-color-red ((t (:foreground ,easter-red-2
                                       :background ,easter-red-4))))
   `(term-color-green ((t (:foreground ,easter-green
                                       :background ,easter-green+2))))
   `(term-color-yellow ((t (:foreground ,easter-orange
                                       :background ,easter-yellow))))
   `(term-color-blue ((t (:foreground ,easter-blue-1
                                      :background ,easter-blue-4))))
   `(term-color-magenta ((t (:foreground ,easter-violet
                                         :background ,easter-red))))
   `(term-color-cyan ((t (:foreground ,easter-cyan
                                       :background ,easter-blue))))
   `(term-color-white ((t (:foreground ,easter-fg
                                       :background ,easter-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,easter-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,easter-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,easter-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,easter-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,easter-cyan))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,easter-bg-05))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,easter-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,easter-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,easter-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,easter-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,easter-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,easter-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,easter-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,easter-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,easter-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,easter-bg+1 :foreground ,easter-bg+1))))
   `(whitespace-hspace ((t (:background ,easter-bg+1 :foreground ,easter-bg+1))))
   `(whitespace-tab ((t (:background ,easter-red-1))))
   `(whitespace-newline ((t (:foreground ,easter-bg+1))))
   `(whitespace-trailing ((t (:background ,easter-red))))
   `(whitespace-line ((t (:background ,easter-bg :foreground ,easter-violet))))
   `(whitespace-space-before-tab ((t (:background ,easter-orange :foreground ,easter-orange))))
   `(whitespace-indentation ((t (:background ,easter-yellow :foreground ,easter-red))))
   `(whitespace-empty ((t (:background ,easter-yellow))))
   `(whitespace-space-after-tab ((t (:background ,easter-yellow :foreground ,easter-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,easter-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,easter-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,easter-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,easter-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,easter-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,easter-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,easter-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,easter-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,easter-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,easter-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,easter-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,easter-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,easter-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,easter-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,easter-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,easter-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,easter-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,easter-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,easter-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,easter-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,easter-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,easter-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,easter-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,easter-violet))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,easter-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,easter-green+4))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,easter-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,easter-bg-1 :foreground ,easter-bg-1))))
   ))

;;; Theme Variables
(easter-with-color-variables
  (custom-theme-set-variables
   'easter
;;;;; ansi-color
   `(ansi-color-names-vector [,easter-bg ,easter-red ,easter-green ,easter-yellow
                                          ,easter-blue ,easter-violet ,easter-cyan ,easter-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,easter-bg-05)
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,easter-red-1)
       ( 40. . ,easter-red)
       ( 60. . ,easter-orange)
       ( 80. . ,easter-yellow-2)
       (100. . ,easter-yellow-1)
       (120. . ,easter-yellow)
       (140. . ,easter-green-1)
       (160. . ,easter-green)
       (180. . ,easter-green+1)
       (200. . ,easter-green+2)
       (220. . ,easter-green+3)
       (240. . ,easter-green+4)
       (260. . ,easter-cyan)
       (280. . ,easter-blue-2)
       (300. . ,easter-blue-1)
       (320. . ,easter-blue)
       (340. . ,easter-blue+1)
       (360. . ,easter-violet)))
   `(vc-annotate-very-old-color ,easter-violet)
   `(vc-annotate-background ,easter-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar easter-add-font-lock-keywords nil
  "Whether to add font-lock keywords for easter color names.
In buffers visiting library `easter-theme.el' the easter
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar easter-colors-font-lock-keywords nil)

(defadvice rainbow-turn-on (after easter activate)
  "Maybe also add font-lock keywords for easter colors."
  (when (and (derived-mode-p 'emacs-lisp-mode)
             (or easter-add-font-lock-keywords
                 (equal (file-name-nondirectory (buffer-file-name))
                        "easter-theme.el")))
    (unless easter-colors-font-lock-keywords
      (setq easter-colors-font-lock-keywords
            `((,(regexp-opt (mapcar 'car easter-colors-alist) 'words)
               (0 (rainbow-colorize-by-assoc easter-colors-alist))))))
    (font-lock-add-keywords nil easter-colors-font-lock-keywords)))

(defadvice rainbow-turn-off (after easter activate)
  "Also remove font-lock keywords for easter colors."
  (font-lock-remove-keywords nil easter-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'easter)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; easter-theme.el ends here
