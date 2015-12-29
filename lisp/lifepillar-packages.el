;; Manage package installation (copied from Emacs Prelude).
(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; To install a new package, add it to this list and reload init.el.
(defvar lifepillar/package-list
  '(ace-window
    anti-zenburn-theme
    atom-dark-theme
    atom-one-dark-theme
    avy
    diminish
    helm
    linum-relative
    solarized-theme
    which-key
    zenburn-theme)
  "A list of packages that should be automatically installed if not present.")

(defun lifepillar/packages-installed-p ()
  "Check if all packages in `lifepillar/package-list' are installed."
  (every #'package-installed-p lifepillar/package-list))

(defun lifepillar/require-package (package)
  "Try to install PACKAGE unless already installed.
In case of error, an error message is logged."
  (unless (package-installed-p package)
    (condition-case err
                    (package-install package)
                    (error
                      (message "***ERROR***: failed to install package `%s': %S" package err)
                      nil))))

(defun lifepillar/require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'lifepillar/require-package packages))

(defun lifepillar/install-packages ()
  "Install all packages listed in `lifepillar/package-list'."
  (unless (lifepillar/packages-installed-p)
    ;; Check for new packages (package versions)
    (message "%s" "Refreshing my package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; Install the missing packages
    (lifepillar/require-packages lifepillar/package-list)))

;; Run package installation
(lifepillar/install-packages)

;; ace-window
(require 'ace-window)
(global-set-key (kbd "M-p") 'ace-window)

;; Avy
(avy-setup-default)
(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g g") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

;; Helm
(require 'helm-config)
(helm-mode 1)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(global-set-key (kbd "M-x") 'helm-M-x)

; (unless (boundp 'completion-in-region-function)
;   (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
;   (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

; (when (executable-find "curl")
;   (setq helm-google-suggest-use-curl-p t))

; (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;       helm-ff-file-name-history-use-recentf t)


(require 'which-key)
(which-key-mode)

(require 'diminish)
(diminish 'helm-mode)
(diminish 'which-key-mode)

(provide 'lifepillar-packages)

