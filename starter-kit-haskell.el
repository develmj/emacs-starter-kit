
(let ((hsm-dir "~/.emacs.d/vendor/haskellmode"))
  (unless (member hsm-dir load-path)
    (setq load-path (append load-path (list hsm-dir)))))

(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'font-lock-mode)

(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide 'starter-kit-haskell)
