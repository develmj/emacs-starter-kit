;;; starter-kit-js.el --- Some helpful Javascript helpers
;;
;; Part of the Emacs Starter Kit


(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(defadvice js2-reparse (before json)
	(setq js2-buffer-file-name buffer-file-name))
(ad-activate 'js2-reparse)

(defadvice js2-parse-statement (around json)
	(if (and (= tt js2-LC)
			js2-buffer-file-name
			(string-equal (substring js2-buffer-file-name -5) ".json")
			(eq (+ (save-excursion
						(goto-char (point-min))
						(back-to-indentation)
						(while (eolp)
							(next-line)
							(back-to-indentation))
						(point)) 1) js2-ts-cursor))
		(setq ad-return-value (js2-parse-assign-expr))
		ad-do-it))
(ad-activate 'js2-parse-statement)



;; (autoload 'espresso-mode "espresso" "Start espresso-mode" t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
;; (add-hook 'espresso-mode-hook 'moz-minor-mode)
;; (add-hook 'espresso-mode-hook 'esk-paredit-nonlisp)
;; (add-hook 'espresso-mode-hook 'run-coding-hook)
;; (setq espresso-indent-level 2)

;; ;; If you prefer js2-mode, use this instead:
;; ;; (add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))

;; (eval-after-load 'espresso
;;   '(progn (define-key espresso-mode-map "{" 'paredit-open-curly)
;;           (define-key espresso-mode-map "}" 'paredit-close-curly-and-newline)
;;           ;; fixes problem with pretty function font-lock
;;           (define-key espresso-mode-map (kbd ",") 'self-insert-command)
;;           (font-lock-add-keywords
;;            'espresso-mode `(("\\(function *\\)("
;;                              (0 (progn (compose-region (match-beginning 1)
;;                                                        (match-end 1) "ƒ")
;;                                        nil)))))))

(provide 'starter-kit-js)
;;; starter-kit-js.el ends here
