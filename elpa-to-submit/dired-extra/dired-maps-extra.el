;;if you want to get size of all marked files you an simple call an external process of du:

(defun dired-get-size ()
	(interactive)
	(let ((files (dired-get-marked-files)))
		(with-temp-buffer
			(apply 'call-process "/usr/bin/du" nil t nil "-sch" files)
			(message "Size of all marked files: %s"
				(progn 
					(re-search-backward "\\(^[0-9.]+[A-Za-z]+\\).*total$")
					(match-string 1))))))

(define-key dired-mode-map (kbd "f") 'dired-get-size)


;; That was the easy way â¦ more fun would it be if you can get the file size just using elisp.
;;I havenât found a real convincing way to do that, but that piece of code works:

(defun cdrw-get-size ()
	(interactive)
  (let ((sum 0)
				 (files (dired-get-marked-files)))
		(dolist (file files (format "%.1fM" sum))
			(incf sum (/ (nth 8 (car 
														(directory-files-and-attributes (file-name-directory file) nil 
															(regexp-quote (file-name-nondirectory file))))) 1048576.0)))))

(defun dired-map-tar ()
	(interactive)
  (require 'dired)
	(let* ((flist (dired-get-marked-files))
					(command "tar jcf "))
		(dolist (curr flist)
			;; need to get only the directory name; not the path
			(setq command (concat command (concat curr ".tar.bz2 ") curr))
			(print command))
		(dired-run-shell-command command )
		(revert-buffer)))

(define-key dired-mode-map (kbd "b") 'dired-map-tar)

(defun dired-map-untar ()
	(interactive)
  (require 'dired)
	(let* ((flist (dired-get-marked-files))
					(command "tar jxf "))
		(dolist (curr flist)
			;; need to get only the directory name; not the path
			(setq command (concat command curr))
			(print command))
		(dired-run-shell-command command )
		(revert-buffer)))


(defun dired-map-delete-dir ()
	(interactive)
  (require 'dired)
	(let* ((flist (dired-get-marked-files))
					(command "rm -rf "))
		(when (yes-or-no-p "Delete the marked directory?")
			(dolist (curr flist)
				(setq command (concat command curr " ")))
			(dired-run-shell-command command)
			(revert-buffer))))


(define-key dired-mode-map (kbd "d") 'dired-map-delete-dir)



(provide 'dired-maps-extra)