
(defun bash-start ()
  "Open a bash window in the current directory."
  (interactive)
  (start-process-shell-command
   "*gse-bash*"
   nil
   "gnome-terminal"
		""
))

;;---------------------------------------------------------------------------

(provide 'bash-start)
