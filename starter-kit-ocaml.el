
(setq auto-mode-alist
          (cons '("\\.ml[iyl]?$" .  caml-mode) auto-mode-alist))


(setq load-path (cons "~/.emacs.d/vendor/ocaml" load-path))

(autoload 'caml-mode "ocaml" (interactive)
  "Major mode for editing Caml code." t)
(autoload 'camldebug "camldebug" (interactive) "Debug caml mode")

(provide 'starter-kit-ocaml)
