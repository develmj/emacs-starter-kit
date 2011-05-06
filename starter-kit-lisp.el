;;; starter-kit-lisp.el --- Some helpful Lisp code
;;
;; Part of the Emacs Starter Kit

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "C-c l") "lambda")
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)
(define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)

(defface esk-paren-face
   '((((class color) (background dark))
      (:foreground "grey50"))
     (((class color) (background light))
      (:foreground "grey55")))
   "Face used to dim parentheses."
   :group 'starter-kit-faces)

;;; Emacs Lisp

(defun paren-change ()
  (require 'cparen)
  (cparen-activate)
  (require 'paredit)
  (paredit-mode 1))


(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'esk-remove-elc-on-save)
(add-hook 'emacs-lisp-mode-hook 'paren-change)

(defun esk-remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))

(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

;;; Clojure

(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.clj"))

(defun clojure-project ()
  (interactive)
  (message "Deprecated in favour of M-x swank-clojure-project. Install swank-clojure from ELPA."))

;;; Enhance Lisp Modes

(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\>\\)"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit/slime-contrib"))
(add-to-list 'load-path (concat dotfiles-dir "/deps/swank-cl"))

(eval-after-load "slime"
  '(progn
     (add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))
     (require 'slime-fuzzy)
     (require 'slime-banner)
     (setq
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      slime-enable-evaluate-in-emacs t
      slime-fuzzy-completion-in-place t
      slime-startup-animation t
      slime-use-autodoc-mode t)

    (define-key slime-mode-map (kbd "C-c s") 'slime-selector)
    (define-key slime-repl-mode-map (kbd "C-c s") 'slime-selector)
    (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
    (define-key slime-mode-map [f11] 'slime-cheat-sheet)

    (def-slime-selector-method ?4
      "Switch to #clojure on Freenode" "#clojure")

    (def-slime-selector-method ?j
      "most recently visited clojure-mode buffer."
      (slime-recently-visited-buffer 'clojure-mode))

    ;; (autoload 'paredit-mode "paredit"
    ;;     "Minor mode for pseudo-structurally editing Lisp code."		
    ;;     t)
    (require 'clj-parenface)
    (add-hook 'clojure-mode-hook 'tweak-clojure-syntax)
    ;; (add-hook 'clojure-mode-hook '(lambda () (paredit-mode 1)))
    (require 'slime-clojure-extra)))

(require 'slime-banner)
(add-hook 'slime-load-hook (lambda () (require 'slime-banner)))
(add-hook 'slime-load-hook (lambda () (require 'slime-asdf)))

(eval-after-load "clojure-mode"
  '(progn
     (require 'slime)
     (add-hook 'clojure-mode-hook (lambda () (slime-mode t)))))

(add-hook 'scheme-mode-hook '(lambda () (paredit-mode 1)))
(add-to-list 'interpreter-mode-alist '("jark" . clojure-mode))
(provide 'starter-kit-lisp)
;; starter-kit-lisp.el ends here
