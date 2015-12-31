(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/auto-save/" t))))
 '(auto-save-list-file-prefix nil)
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(column-number-mode t)
 '(confirm-nonexistent-file-or-buffer nil)
 '(create-lockfiles nil)
 '(global-linum-mode t)
 '(gnus-directory "~/.emacs.d/news")
 '(gnus-large-newsgroup 5000)
 '(gnus-message-archive-method
   (quote
    (nnfolder "archive"
	      (nnfolder-inhibit-expiry t)
	      (nnfolder-active-file ~/\.emacs\.d/news/sent/active)
	      (nnfolder-directory ~/\.emacs\.d/news/sent/))))
 '(gnus-novice-user nil)
 '(gnus-read-newsrc-file nil)
 '(gnus-save-newsrc-file nil)
 '(gnus-secondary-select-methods
   (quote
    ((nntp "freenews.netfront.net"
	   (nntp-port-number 119)))))
 '(gnus-select-method
   (quote
    (nntp "news.gmane.org"
	  (nntp-port-number 563)
	  (nntp-open-connection-function nntp-open-ssl-stream))))
 '(gnus-sum-thread-tree-false-root "▫ ")
 '(gnus-sum-thread-tree-indent " ")
 '(gnus-sum-thread-tree-leaf-with-other "├─▸ ")
 '(gnus-sum-thread-tree-root "▪ ")
 '(gnus-sum-thread-tree-single-indent "- ")
 '(gnus-sum-thread-tree-single-leaf "╰─▸ ")
 '(gnus-sum-thread-tree-vertical "│")
 '(gnus-summary-dummy-line-format
   "    %8{│%}                %8{│%}   %(%8{│%}                       %7{│%}%) %*%6{┊%}  %S\\n")
 '(gnus-summary-line-format
   "%8{%4k│%}%8{%16,16&user-date;│%}%9{%U%R%z%}%8{│%}%(%-23,23f%)%7{│%} %*%6{%B%} %S\\n")
 '(gnus-suppress-duplicates t)
 '(gnus-thread-indent-level 2)
 '(gnus-thread-sort-functions
   (quote
    (gnus-thread-sort-by-number gnus-thread-sort-by-most-recent-number)))
 '(gnus-user-date-format-alist
   (quote
    (((gnus-seconds-today)
      . "Today, %H:%M")
     ((+ 86400
	 (gnus-seconds-today))
      . "Yesterday, %H:%M")
     (604800 . "%A %H:%M")
     (t . "%d/%m/%Y %H:%M"))))
 '(hscroll-step 2)
 '(inhibit-default-init t)
 '(inhibit-startup-screen t)
 '(line-spacing 2)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(message-log-max 65536)
 '(next-line-add-newlines t)
 '(package-enable-at-startup nil)
 '(recentf-mode t)
 '(recentf-save-file "~/.emacs.d/tmp/recentf")
 '(save-place t nil (saveplace))
 '(save-place-file "~/.emacs.d/tmp/saved-places")
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(scroll-margin 2)
 '(show-paren-mode t)
 '(sql-postgres-options (quote ("-e" "-P" "pager=off")))
 '(tool-bar-mode nil)
 '(tooltip-use-echo-area t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 110 :width normal)))))
