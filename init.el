;; Lifepillar's Emacs Initialization File

;; Set up search paths (see C-h v load-path)
(push (expand-file-name "lisp" user-emacs-directory) load-path)

;; See http://www.emacswiki.org/emacs/LoadPath
(defun lifepillar/add-subdirs-to-load-path (dir)
  (let ((default-directory dir))
    (setq load-path
          (append
            (let ((load-path (copy-sequence load-path))) ;; Shadow
              (normal-top-level-add-subdirs-to-load-path))
            load-path))))

(lifepillar/add-subdirs-to-load-path
  (expand-file-name "site-lisp/" user-emacs-directory))

;; Temporarily reduce garbage collection during startup (speeds up startup a bit)
(defconst lifepillar/initial-gc-cons-threshold gc-cons-threshold
          "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold lifepillar/initial-gc-cons-threshold)))

;; Measure initialization time
(add-hook 'after-init-hook
          '(lambda ()
             (let ((elapsed (float-time (time-subtract after-init-time before-init-time))))
               (message "Initialization completed in %.3fs " elapsed)))
          t)

;; Set up Unicode
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; Check/install/initialize packages
(require 'lifepillar-packages)

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

;; Customization file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Override theme in terminal
(if (display-graphic-p)
  (load-theme 'solarized-light t)
  (load-theme 'zenburn t))

