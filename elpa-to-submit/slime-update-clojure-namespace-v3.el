;; Use of clojure-find-package suggested by Jürgen Hötzel
(defun slime-update-clojure-namespace (arg) 
  "Find the namespace in the current buffer and use SLIME's REPL 
to switch to it, updating the namespace for all buffers.
Using an universal prefix will ask for the name of the namespace.
The actual namespace switch is done by calling `SLIME-REPL-SET-PACKAGE'." 
  (interactive "P")
  (if arg
      (call-interactively 'slime-repl-set-package)
    (let ((ns (clojure-find-package))) ;; find the (in-ns ...) ns string
      (if ns
	  (slime-repl-set-package ns)
	;; no package found
	(call-interactively 'slime-repl-set-package)))))
