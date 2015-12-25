;; Lifepillar's Emacs Initialization File

(defvar lifepillar-emacs-dir (file-name-directory load-file-name)
  "Emacs configuration directory (typically, but not necessarily, '~/.emacs.d/'.")


;; Customization file
(setq custom-file (concat lifepillar-emacs-dir "custom.el"))
(load custom-file)


;; Set up Unicode
(prefer-coding-system 'utf-8)


;; Set default font (GUI)
(when (display-graphic-p)
  (defconst lifepillar-default-font "Menlo")

  (if (find-font (font-spec :name lifepillar-default-font))
    (set-frame-font (font-spec :family lifepillar-default-font :size 11 :weight 'normal) t t)
    (message "Cannot find font \"%s\"!" lifepillar-default-font))

  (setq-default line-spacing 2))

