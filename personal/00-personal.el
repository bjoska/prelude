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

;;; Enable global yasnippet mode
(require 'yasnippet)
(setq yas-global-mode t)

;;; Enable global auto-complete-mode
(require 'auto-complete-config)
(global-auto-complete-mode t)
(auto-complete-mode t)

;;; Erlang root dir
(setq erlang-root-dir "/usr/lib/erlang")

;; Custom Keyboard Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Just in place to ensure I stop using the arrow keys.
;; (global-unset-key (kbd "<left>"))
;; (global-unset-key (kbd "<right>"))
;; (global-unset-key (kbd "<up>"))
;; (global-unset-key (kbd "<down>"))

;; In place to make me use the "shift-[arrow key]" instead of "C-x o".
;; changed to enable nav in terminal.
;; (global-unset-key (kbd "C-x o"))

;; Slowly resetting everything back to default
(global-set-key (kbd "<up>") 'previous-line)
(global-set-key (kbd "<down>") 'next-line)

;; Font change
;; (set-face-attribute 'default nil :font "Bitstream Vera Sans Mono-11")
(set-frame-font "Bitstream Vera Sans Mono-11")

;; Set face background
;; (global-hl-line-mode 0)
;; (set-face-background 'region "dark green")

(provide 'personal)
;;; personal.el ends here
