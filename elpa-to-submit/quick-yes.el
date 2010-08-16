;;; quick-yes.el --- M-y to answer "yes" to `yes-or-no-p'.

;; Copyright (C) 2004, 2005 Kevin Ryde
;;
;; quick-yes.el is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the
;; Free Software Foundation; either version 2, or (at your option) any later
;; version.
;;
;; quick-yes.el is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
;; Public License for more details.
;;
;; You can get a copy of the GNU General Public License online at
;; http://www.gnu.org/licenses/gpl.txt, or you should have one in the file
;; COPYING which comes with GNU Emacs and other GNU programs.  Failing that,
;; write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.


;;; Commentary:

;; This is a little spot of code for binding M-y to answer "yes" to a
;; `yes-or-no-p' question.
;;
;; Many `yes-or-no-p' questions can be disabled, but if leave them enabled
;; as a reminder or just in case it's important, then quick-yes is a good
;; shortcut for accepting.
;;
;; If you start typing "y", "ye", etc, you can still use M-y to finish it.
;; Typing "y" is easy to do if you don't realize immediately realize it's a
;; `yes-or-no-p' instead of `y-or-n-p'.
;;
;; quick-yes only affects a minibuffer `yes-or-no-p' question, it doesn't
;; change a window system dialog box.

;;; Install:

;; Put quick-yes.el somewhere in your `load-path', and in your .emacs put
;;
;;     (require 'quick-yes)

;;; History:

;; Version 1 - the first version.


;;; Code:

;; This is implemented as an advice around `yes-or-no-p' and a separate
;; `quick-yes-map' so as to restrict the effect to just `yes-or-no-p'.  All
;; other minibuffer reading is unchanged, and M-y can be bound to other
;; things in other minibuffer contexts, including through a user addition to
;; `minibuffer-local-map'.

(defun quick-yes-answer-yes ()
  "Say \"yes\" in the minibuffer."
  (interactive)
  ;; there's always at least "(yes or no)" in the prompt, so these
  ;; substrings are in range
  (cond ((string= "y" (buffer-substring (1- (point)) (point)))
         (insert "es"))
        ((string= "ye" (buffer-substring (- (point) 2) (point)))
         (insert "s"))
        ((string= "yes" (buffer-substring (- (point) 3) (point))))
        (t
         (insert "yes")))
  (exit-minibuffer))

(defvar quick-yes-map
  (let ((m (make-sparse-keymap)))
    (define-key m [?\M-y] 'quick-yes-answer-yes)
    (set-keymap-parent m minibuffer-local-map)
    m)
  "Extra keymap advised around `yes-or-no-p'.")

(defadvice yes-or-no-p (around quick-yes activate)
  "\\<quick-yes-map>\\[quick-yes-answer-yes] to answer yes."
  (let ((minibuffer-local-map quick-yes-map))
    ad-do-it))

(provide 'quick-yes)

;;; quick-yes.el ends here
