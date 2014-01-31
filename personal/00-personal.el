;;; Code:
;; In place to prevent me from closing emacs.
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-x C-z"))

;; There seems to be an issue using english layout on a swedish
;; keyboard, this will ensure that the comment-region command works.
(global-set-key (kbd "<f12>") 'comment-or-uncomment-region)
(global-set-key (kbd "<f11>") 'menu-bar-mode)
(global-set-key (kbd "M-ö") 'comment-dwim)

;; Changing hippie-expand binding from M-/ to <ESC>
(global-set-key (kbd "<escape>") 'hippie-expand)

;; Addition of line numbers in the gutter.
(global-linum-mode 1)

;;; Addition of HTML+Ruby mmm-mode
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.erb\\'" 'html-erb)
(mmm-add-mode-ext-class 'html-mode "\\.rhtml\\'" 'html-erb)

;;; Enable Ruby-end-mode - might not be needed.
(add-hook 'ruby-mode (lambda () (ruby-end-mode 1)))

(add-hook 'ruby-mode-hook 'robe-mode)

;;; Enable whitespace-mode
(setq global-whitespace-mode 1)

;;; Enable global yasnippet mode
(require 'yasnippet)
(setq yas-global-mode t)

;;(require 'color-theme-sanityinc-solarized)
;;; Set the theme
;; (load-theme 'deeper-blue t)
(load-theme 'zenburn t)
;;(setq color-theme-sanityinc-solarized-dark t)

;;; enable global auto-complete-mode
(require 'auto-complete-config)
(setq global-auto-complete-mode t)
(setq auto-complete-mode t)


;;; Erlang root dir
(setq erlang-root-dir "/usr/lib/erlang")

;; Custom Keyboard Bindings

;;; enable eredis
(require 'eredis)

;;; Tretti parameters indentation
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; custom keyboard bindings

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; just in place to ensure i stop using the arrow keys.
;; (global-unset-key (kbd "<left>"))
;; (global-unset-key (kbd "<right>"))
;; (global-unset-key (kbd "<up>"))
;; (global-unset-key (kbd "<down>"))

;; In place to make me use the "shift-[arrow key]" instead of "C-x o".
;; changed to enable nav in terminal.
;; (global-unset-key (kbd "C-x o"))

;; slowly resetting everything back to default
(global-set-key (kbd "<up>") 'previous-line)
(global-set-key (kbd "<down>") 'next-line)

;; Remove the smart-parens for def-end
;; (sp-local-pair '(ruby-mode enh-ruby-mode) "class" nil :actions :rem)
;; (sp-local-pair '(ruby-mode enh-ruby-mode) "module" nil :actions :rem)

;; theme change depending on time of day.
;; (require 'theme-changer)
;; (setq calendar-location-name "malmö, sweden")
;; (setq calendar-latitude 55.60)
;; (setq calendar-longitude 13.00)
;; (setq theme-changer-mode "color-theme")
;; (change-theme 'color-theme-sanityinc-solarized-dark 'color-theme-sanityinc-solarized-dark)

;; font change
(set-face-attribute 'default nil :font "terminus-14")
(set-frame-font "terminus-14")
;; (set-frame-font "bitstream vera sans mono-11")

;; set face background
;; (global-hl-line-mode 0)
;; (set-face-background 'region "dark green")

;;; tidy xml
(defun bf-pretty-print-xml-region (begin end)
  "pretty format xml markup in region. you need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/nxmlmode installed to do
this.  the function inserts linebreaks to separate tags that have
nothing but whitespace between them.  it then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "ah, much better!"))

(require 'scss-mode)
(setq scss-compile-at-save nil)

(provide 'personal)
;;; personal.el ends here
