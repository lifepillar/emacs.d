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


;; Theme
(load-theme 'solarized t)


;; Line numbers
;; See http://www.emacswiki.org/emacs/LineNumbers
(add-hook 'linum-before-numbering-hook
          (lambda ()
            (setq-local linum-format-fmt
                        (let ((w (length (number-to-string
                                           (count-lines (point-min) (point-max))))))
                          (concat " %" (number-to-string w) "d")))))

(defun linum-format-func (line)
  (concat
    (propertize (format linum-format-fmt line) 'face 'linum)
    (propertize " " 'face 'linum)))

(setq linum-format 'linum-format-func)


;; Key bindings
(global-set-key (kbd "C-x C-b") 'ibuffer)

