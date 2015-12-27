;; Lifepillar's Emacs Initialization File


;; Customization file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)


;; Measure initialization time
(add-hook 'after-init-hook
          '(lambda ()
             (let ((elapsed (float-time (time-subtract after-init-time before-init-time))))
               (message "Initialization completed in %.3fs " elapsed)))
          t)

;; Set up Unicode
(prefer-coding-system 'utf-8)


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



