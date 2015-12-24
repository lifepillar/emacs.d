;; Lifepillar's Emacs Initialization File

;;
;; Environment
;;

;; No global initialization
(setq inhibit-default-init t)

;; No welcome buffer
(setq inhibit-startup-screen t)

;; Size of log buffer
(setq message-log-max 65536)

;; Set up Unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Mouse reporting in the terminal
(unless (display-graphic-p)
  (require 'mouse)
  (xterm-mouse-mode t))

;;
;; Helper functions
;;
(defun lifepillar-warning (msg &rest args)
  "Display MSG as a warning in buffer `*Messages*'.
The message is always displayed. "
  (message "Warning: %s" (apply 'format msg args)))

;;
;; Appearance
;;

;; No menu bar
(menu-bar-mode -1)


;;
;; GUI
;;

(when (display-graphic-p)

  ;; Remove the toolbar
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))

  ;; Remove the scrollbar
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))

  ;; Tooltips in echo-area
  (when (and (fboundp 'tooltip-mode) (not (eq tooltip-mode -1)))
    (tooltip-mode -1))

  ;; Font
  (defconst lifepillar-default-font "Menlo")

  (if (find-font (font-spec :name lifepillar-default-font))
    (set-frame-font (font-spec :family lifepillar-default-font :size 11 :weight 'normal) t t)
    (lifepillar-warning "Cannot find font \"%s\"!" lifepillar-default-font))

  (setq-default line-spacing 2))
