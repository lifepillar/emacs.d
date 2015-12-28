;; Manage package installation (copied from Emacs Prelude).
(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; To install a new package, add it to this list and reload init.el.
(defvar lifepillar/package-list
  '(anti-zenburn-theme
    atom-dark-theme
    atom-one-dark-theme
    color-theme-solarized
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

(provide 'lifepillar-packages)

