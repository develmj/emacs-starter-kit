(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit/jabber"))

(defun jabber-connect ()
  (interactive)
  (jabber-connect)
  (jabber-switch-to-roster-buffer))

(require 'jabber)
(require 'jabber-ft-server)
(require 'jabber-ft-client)
(require 'jabber-socks5)


(get-buffer-create jabber-process-buffer) 

(require 'jabber-festival)
(require 'jabber-alert)
(require 'osd)

(defun osd (message)
  "Display a message using the osd_cat program. "
  (osd-show-string-on-inherited-display message))

(setq jabber-show-resources t)

(setq osd-program-args
      '("--pos"          "bottom"
        "--offset"       "30"
        "--align"        "right"
        "--delay"        "10"
        "--color"        "red"
        "--outline"      "1"
        "--shadow"       "3"
        "--shadowcolour" "#1e2320"
        "--font"
        "-*-new century schoolbook-bold-i-*-*-17-*-*-*-*-*-*-*"))

(defun jabber-message-xosd (from buffer text propsed-alert)
  (osd (jabber-jid-displayname jabber-chatting-with)))

(add-to-list 'jabber-alert-message-hooks
             'jabber-message-xosd)

(require 'jabber-history)
(setq jabber-avatar-set nil)
(setq jabber-vcard-avatars-retrieve nil)

(setq jabber-chat-header-line-format
      '(" " (:eval (jabber-jid-displayname jabber-chatting-with))
        " " (:eval (jabber-jid-resource jabber-chatting-with)) "\t";
        (:eval (let ((buddy (jabber-jid-symbol jabber-chatting-with)))
                 (propertize
                  (or
                   (cdr (assoc (get buddy 'show) jabber-presence-strings))
                   (get buddy 'show))
                  'face
                  (or (cdr (assoc (get buddy 'show) jabber-presence-faces))
                      'jabber-roster-user-online))))
        "\t" (:eval (get (jabber-jid-symbol jabber-chatting-with) 'status))
        (:eval (unless (equal "" *jabber-current-show*)
                 (concat "\t You're " *jabber-current-show*
                         " (" *jabber-current-status* ")")))))

(provide 'starter-kit-jabber)
