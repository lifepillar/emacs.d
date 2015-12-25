;; Lifepillar's Emacs Initialization File

(defconst lifepillar-emacs-dir
          (file-name-directory load-file-name)
          "Emacs configuration directory.
This is typically, but not necessarily, '~/.emacs.d/': it may be different,
for example, if you run emacs with `-q -l`).")


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

