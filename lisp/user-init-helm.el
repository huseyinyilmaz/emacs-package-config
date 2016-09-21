;;; user-init-helm.el --- Helm configuration
;; setup virtual environment path
;; (add-hook 'python-mode-hook
;;           #'(lambda ()
;;               (when (virtualenv-p)
;;                 (setq python-shell-virtualenv-path (virtualenv-current)))
;;               (when (projectile-project-p)
;;                (setenv "PYTHONPATH" (projectile-project-root)))))


;;; Commentary:
;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Generated by emacs-helm.sh ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq initial-scratch-message (concat initial-scratch-message
";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n;; This Emacs is Powered by `HELM' using\n;; emacs program \"emacs\".\n;; This is a minimal `helm' configuration to discover `helm' or debug it.\n;; You can retrieve this minimal configuration in \"/tmp/helm-cfg.el\" \n;; Some originals emacs commands have been replaced by own `helm' commands:\n\n;; - `find-file'(C-x C-f)           =>`helm-find-files'\n;; - `occur'(M-s o)                 =>`helm-occur'\n;; - `list-buffers'(C-x C-b)        =>`helm-buffers-list'\n;; - `completion-at-point'(M-tab)   =>`helm-lisp-completion-at-point'[1]\n;; - `dabbrev-expand'(M-/)          =>`helm-dabbrev'\n\n;; Some others native emacs commands are \"helmized\" by `helm-mode'.\n;; [1] Coming with emacs-24.4 `completion-at-point' is \"helmized\" by `helm-mode'\n;; which provide helm completion in many other places like `shell-mode'.\n;; You will find embeded help for most helm commands with `C-c ?'.\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n\n"))

(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (tool-bar-lines . 0)
                            (menu-bar-lines . 0)
                            (fullscreen . nil)))
(blink-cursor-mode -1)
(add-to-list 'load-path (file-name-directory (file-truename "./emacs-helm.sh")))
(require 'helm-config)

(require 'helm-command) ;; to provide helm-M-x function

;;(define-key global-map [remap find-file] 'helm-find-files)
;;(define-key global-map [remap list-buffers] 'helm-buffers-list)

(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)

(global-set-key (kbd "M-x") 'helm-M-x)

(unless (boundp 'completion-in-region-function)
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))
(add-hook 'kill-emacs-hook #'(lambda () (and (file-exists-p "/tmp/helm-cfg.el") (delete-file "/tmp/helm-cfg.el"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Adaptative sorting of candidates for Helm.
(add-hook 'helm-after-initialize-hook #'(lambda ()
                                          (helm-adaptive-mode 1)
                                          ;; autoresizes helm window
                                          (helm-autoresize-mode 1)
                                          ))

;; Turn on helm-projectile
(helm-projectile-on)

(message "config helm")

(provide 'user-init-helm)

;;; user-init-helm.el ends here
