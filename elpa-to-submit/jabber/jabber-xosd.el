(require 'osd)

(defun osd(message)
   "Display a message using the osd_cat program. "
   (osd-show-string-on-inherited-display message))

; #dcdccc
 (setq osd-program-args
       '("--pos"          "top"
         "--offset"       "30"
         "--align"        "right"
         "--delay"        "10"
         "--color"        "dodgerblue1"
         "--outline"      "1"
         "--shadow"       "3"
         "--shadowcolour" "#1e2320"
         "--font"
         "-*-new century schoolbook-bold-i-*-*-17-*-*-*-*-*-*-*"))


(setq font-lock-maximum-decoration t)

(defun jabber-xosd-display-message (message)
  "Displays MESSAGE through the xosd"
  (let ((process-connection-type nil))
    (start-process "jabber-xosd" nil "osd_cat" "-p" "bottom" "-c" "green" "-A" "right" "-f" "-*-courier-*-*-*-*-13" "-d"
                   (number-to-string jabber-xosd-display-time))
    (process-send-string "jabber-xosd" message)
    (process-send-eof "jabber-xosd")))


(defun jabber-message-xosd (from buffer text propsed-alert)
  (osd (jabber-jid-displayname jabber-chatting-with)))

(add-to-list 'jabber-alert-message-hooks 'jabber-message-xosd)

(provide 'jabber-xosd)

