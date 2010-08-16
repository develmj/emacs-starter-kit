;; svn checkout http://distel.googlecode.com/svn/trunk/ distel

(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit/distel"))

(setq erlang-root-dir "/usr/lib/erlang")
(setq load-path (cons "/usr/lib/erlang/lib/tools-2.6.5.1/emacs" load-path))
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)

;; This is needed for Distel setup
(let ((distel-dir "~/.emacs.d/elpa-to-submit/distel/elisp"))
  (unless (member distel-dir load-path)
    ;; Add distel-dir to the end of load-path
    (setq load-path (append load-path (list distel-dir)))))

(require 'distel)
(distel-setup)


;; Some Erlang customizations
(add-hook 'erlang-mode-hook
	  (lambda ()
	    ;; when starting an Erlang shell in Emacs, default in the node name
	    (setq inferior-erlang-machine-options '("-sname" "emacs"))
	    ;; add Erlang functions to an imenu menu
	    (imenu-add-to-menubar "imenu")))

;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)	
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind) 
    ("\M-*"      erl-find-source-unwind) 
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
	  (lambda ()
	    ;; add some Distel bindings to the Erlang shell
	    (dolist (spec distel-shell-keys)
	      (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(defun get-erl-man ()
  (interactive)
  (let* ((man-path "/usr/lib/erlang/man")
         (man-args (format "-M %s %s" man-path (current-word))))
    (man man-args)))

(global-set-key [(f6)] (lambda () (interactive) (get-erl-man)))

(add-to-list 'auto-mode-alist '("\\.app$" . erlang-mode))

(provide 'starter-kit-erlang)
