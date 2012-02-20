(setq load-path (cons "~/.emacs.d/vendor/tuareg-2.0.4/" load-path))

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
  (add-to-list 'completion-ignored-extensions ext))

;; (autoload 'caml-mode "ocaml" (interactive)
;;   "Major mode for editing Caml code." t)
;; (autoload 'camldebug "camldebug" (interactive) "Debug caml mode")

(provide 'starter-kit-ocaml)
