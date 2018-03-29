
(server-start)

(setq inhibit-startup-message t)

(set-background-color "black")
(set-foreground-color "green")
(setq line-number-mode t)
(setq column-number-mode t)
(blink-cursor-mode 0)
(tool-bar-mode 0)
(tooltip-mode nil)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)

;;cl-lib
(add-to-list 'load-path	"~/.emacs.d/plugins/cl-lib")

;;org-mode
(add-to-list 'load-path "~/.emacs.d/plugins/org-mode/lisp")
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)
(setq org-startup-indented t)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)

;;auto-complete/popup.el
(add-to-list 'load-path
	"~/.emacs.d/plugins/popup-el")

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;cedet
;(add-to-list 'load-path "~/.emacs.d/plugins/cedet-1.1/common")

;(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;;jde
(add-to-list 'load-path "~/.emacs.d/plugins/jdee-2.4.1/lisp")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/elib-1.0"))
(require 'jde)

;;clojure-mode
(add-to-list 'load-path "~/.emacs.d/plugins/clojure-mode")
(require 'clojure-mode)

;;go-mode
(add-to-list 'load-path "~/.emacs.d/plugins/go-mode")
(require 'go-mode)
(require 'go-mode-autoloads)

(add-to-list 'load-path "~/.emacs.d/plugins/go-errcheck")
(require 'go-errcheck)

(add-to-list 'load-path "~/.emacs.d/plugins/go-autocomplete")
(require 'go-autocomplete)

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd \"M-.\") 'godef-jump)))

;;yasnippet
(add-to-list 'load-path	"~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;;paredit
(add-to-list 'load-path "~/.emacs.d/plugins/paredit")
(require 'paredit)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode);;  (autoload 'paredit-mode "paredit"
(require 'eldoc) ; if not already loaded
(eldoc-add-command
    'paredit-backward-delete
    'paredit-close-round)

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
(defun override-slime-repl-bindings-with-paredit ()
    (define-key slime-repl-mode-map
        (read-kbd-macro paredit-backward-delete-key) nil))
        (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

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

;;ecb
;(custom-set-variables '(ecb-options-version "2.40"))
;(add-to-list 'load-path "~/.emacs.d/plugins/ecb-2.40")
;(require 'ecb)
;(require 'ecb-autoloads)
;(setq stack-trace-on-error nil)
;(setq ecb-auto-activate t ecb-tip-of-the-day nil)

;; Home folder - C:/Home/Jimmy
;; Start up folder - C:/Home/Jimmy/src
(cd "~")
