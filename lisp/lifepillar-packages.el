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

(require 'which-key)
(which-key-mode)

(provide 'lifepillar-packages)

