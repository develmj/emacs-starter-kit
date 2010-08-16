;;-----------------------------------------------------------------------------------------------
 ;; replace string in multi-files
 ;;-----------------------------------------------------------------------------------------------
(defun dired-replace-string (&optional from-string to-string)
	"Replace occurrences of FROM-STRING with TO-STRING over marked files in dired."
	(interactive)
	(let ((b nil)
				 (ls nil))
		(when (not from-string)
			(setq from-string (read-from-minibuffer "Dired replace string:")))
		(when (not to-string)
			(setq to-string (read-from-minibuffer
												(format "Replace string %s with: "
													from-string))))
		(setq ls (dired-map-over-marks (dired-get-filename) nil))
		(mapcar
			(lambda (f)
				(setq b (find-file-noselect f))
				(set-buffer b)
				(goto-char (point-min))
				(replace-string from-string to-string)
				(save-buffer)
				(kill-buffer b))
			ls)))

(provide 'dired-replace-string)