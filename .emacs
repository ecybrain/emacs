;; Home folder - D:/Home/Jimmy
;; Start up folder - D:/Home/Jimmy/src
(setq default-directory "D:/Home/Jimmy/elisp")
(cd "~/src")

;; Global Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(jde-jdk-registry (quote (("1.7" . "C:/Program Files/Java/jdk1.7.0_25")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Global Functions
;; Full-screen mode for Windows
(defun w32-maximize-frame ()
    "Maximize the current frame"
     (interactive)
     (w32-send-sys-command 61488))
(run-with-idle-timer 1 nil 'w32-maximize-frame)

;; Use ./_backup/<filename>.bak as backup file name
(defun make-backup-file-name (file-name)
  (if (not (file-exists-p "./_backup"))
      (make-directory "./_backup"))
  (concat (expand-file-name "./_backup/")
    (file-name-nondirectory file-name)
    ".bak")) 

;; Environment Settings
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'text-mode-hook-identify)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default ident-tabs-mode nil)
(setq-default transient-mark-mode t)
(setq inhibit-startup-message t)
(setq enable-recursive-minibuffers t)

(setq line-number-mode t)
(setq column-number-mode t) 
(setq mouse-yank-at-point t)

;;(set-cursor-color "white")
;;(set-mouse-color "blue")
;;(set-foreground-color "green")
;;(set-background-color "darkblue")
;;(set-face-foreground 'highlight "white")
;;(set-face-background 'highlight "blue")
;;(set-face-foreground 'region "white")
;;(set-face-background 'region "blue")
;;(set-face-foreground 'secondary-selection "skyblue")
;;(set-face-background 'secondary-selection "darkblue") 
(menu-bar-mode 1)
(tool-bar-mode 0)
(tooltip-mode nil)
(setq tooltip-delay 0.1)

;; blink cursor to identify the active window
(blink-cursor-mode 0)

;;cedet
(add-to-list 'load-path
    "~/.emacs.d/plugins/cedet-1.1/common")

(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu

;;ecb
(add-to-list 'load-path
    "~/.emacs.d/plugins/ecb-2.40")
(require 'ecb)
(require 'ecb-autoloads)
(setq stack-trace-on-error nil)
(setq ecb-auto-activate t
      ecb-tip-of-the-day nil)

;;cl-lib
(add-to-list 'load-path
	"~/.emacs.d/plugins/cl-lib")

;;yasnippet
(add-to-list 'load-path
	"~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;;auto-complete/popup.el
(add-to-list 'load-path
	"~/.emacs.d/plugins/popup-el")

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;jde
(add-to-list 'load-path "~/.emacs.d/plugins/jdee-2.4.1/lisp")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/elib-1.0"))
(require 'jde)

;;git-emacs
(add-to-list 'load-path "~/.emacs.d/plugins/git-emacs/")
(require 'git-emacs)
