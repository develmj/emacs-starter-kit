(defun slime-java-describe (symbol-name)
  "Get details on Java class/instance at point."
  (interactive (list (slime-read-symbol-name "Java Class/instance: ")))
  (when (not symbol-name)
    (error "No symbol given"))
  (save-excursion
    (set-buffer (slime-output-buffer))
    (unless (eq (current-buffer) (window-buffer))
      (pop-to-buffer (current-buffer) t))
    (goto-char (point-max))
    (insert (concat "(show " symbol-name ")"))
    (when symbol-name
      (slime-repl-return)
      (other-window 1))))

(define-key slime-mode-map (kbd "C-c d") 'slime-java-describe)
(define-key slime-repl-mode-map (kbd "C-c d") 'slime-java-describe)

(provide 'slime-clojure-extra)


