;;; user-init-flycheck.el --- Configure flycheck syntax checker.

;;; Commentary:
;;

;;; Code:

(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-color-mode-line)

(eval-after-load "flycheck"
  ( lambda ()
    (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
    (add-hook 'flycheck-mode-hook 'flycheck-inline-mode)
  ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Javascript configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use eslint with web-mode for jsx files
;; web-mode is already in the list.
;; (flycheck-add-mode 'javascript-eslint 'web-mode)

;; (eval-after-load "flycheck"
;;   '(setq flycheck-javascript-eslint-executable "yarn eslint --")
;;   )

(eval-after-load "flycheck"
  `(add-hook 'web-mode-hook (lambda () (tern-mode t))))

(setq-default flycheck-flake8-maximum-complexity 10)
;; (setq flycheck-python-flake8-executable "/Users/huseyin/.virtualenvs/flake8/bin/flake8")

;; we want to use mypy
;; (add-to-list 'flycheck-disabled-checkers 'python-flake8)
;; (add-to-list 'flycheck-disabled-checkers 'python-pylint)

;; Change mode faces
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error))))
 '(flycheck-color-mode-line-info-face ((t (:inherit flycheck-fringe-info))))
 '(flycheck-color-mode-line-warning-face ((t (:inherit flycheck-fringe-warning)))))


(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add node modules mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'after-init-hook 'add-node-modules-path)

(eval-after-load 'scss-mode
  '(add-hook 'scss-mode-hook 'add-node-modules-path))

;; (eval-after-load 'scss-mode
;;   #'(add-hook 'scss-mode-hook 'add-node-modules-path))

;; (eval-after-load 'scss-mode
;;   #'(add-hook 'scss-mode-hook #'add-node-modules-path))



(message "config flycheck")

(provide 'user-init-flycheck)
;;; user-init-flycheck.el ends here
