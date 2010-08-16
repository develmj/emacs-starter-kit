

(require 'emms)

(require 'emms-info-libtag)
(require 'emms-player-mpg321-remote)
(emms-devel)
(emms-default-players)
(push 'emms-player-mpg321-remote emms-player-list)
(push 'emms-player-mplayer emms-player-list)
(push 'emms-player-mplayer-playlist emms-player-list)


;; playlist mode : modeline
;; The name of emms-playlist-mode is *way* too long
(add-hook 'emms-playlist-mode-hook
          #'(lambda ()
              (setq mode-name "EMMS")))

(add-hook 'emms-player-started-hook 'emms-show)
(require 'emms-mode-line)
(emms-mode-line 1)
(require 'emms-mode-line-icon)
(setq emms-playlist-buffer-name "*Music*")
(setq
 emms-info-asynchronously t
 later-do-interval 0.0001
 emms-source-file-default-directory "~/media/audio"
 emms-mode-line-format " emms "
 emms-mode-line-icon-color "blue"
 emms-show-format "playing: %s")


(require 'emms-info)
(require 'emms-info-libtag)
(setq emms-info-functions '(emms-info-libtag))
(require 'emms-info-mp3info)
(require 'emms-info-ogginfo)
(add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
(add-to-list 'emms-info-functions 'emms-info-mp3info)
(add-to-list 'emms-info-functions 'emms-info-ogginfo)
(setq emms-track-description-function 'emms-info-track-description)

;; Switch to the radio buffer
(defun my-emms-streams ()
  (interactive)
  (let ((buf (get-buffer emms-stream-buffer-name)))
    (if buf
        (switch-to-buffer buf)
      (emms-streams))))

;; Switch to either the radio buffer or the current EMMS playlist
(defun my-emms-switch-to-current-playlist ()
  (interactive)
  (if (and (boundp 'emms-stream-playlist-buffer)
           (eq emms-stream-playlist-buffer emms-playlist-buffer))
      (switch-to-buffer emms-stream-buffer-name)
    (if (or (null emms-playlist-buffer)
            (not (buffer-live-p emms-playlist-buffer)))
        (error "No current Emms buffer")
      (switch-to-buffer emms-playlist-buffer))))

;;; Key customizations

(define-key emms-playlist-mode-map "q" 'emms-playlist-current-kill)
(define-key emms-playlist-mode-map (kbd "SPC") 'emms-pause)
;; this is the "O" button on the gamepad
;;; (define-key emms-playlist-mode-map (kbd "<prior>") 'emms-player-mpd-previous)
;;; ;; this is the "X" button on the gamepad
;;; (define-key emms-playlist-mode-map (kbd "<next>") 'emms-player-mpd-next)

;; this is the smallest dot on the top row, in the middle section
;; this is the check-mark button on the gamepad
(global-set-key (kbd "<select>") 'emms-pause)

(global-set-key "\C-cm" nil)
(global-set-key "\C-cm " 'emms-pause)
(global-set-key "\C-cm0" 'emms-playlist-current-clear)
(global-set-key "\C-cmc" 'emms-player-mpd-connect)
(global-set-key "\C-cmn" 'emms-player-mpd-next)
(global-set-key "\C-cmo" 'my-emms-switch-to-current-playlist)
(global-set-key "\C-cmp" 'emms-player-mpd-previous)
(global-set-key "\C-cmq" 'emms-stop)
(global-set-key "\C-cmQ" #'(lambda () (interactive) (emms-player-mpd-clear)))
(global-set-key "\C-cmr" 'my-emms-streams)
(global-set-key "\C-cms" 'emms-seek)
(global-set-key "\C-cm-" 'emms-volume-mode-minus)
(global-set-key "\C-cm+" 'emms-volume-mode-plus)
(global-set-key "\C-cm\C-c" 'my-emms-reset-cache)

(setq emms-player-mplayer-command-name "mplayer"
      emms-player-mplayer-parameters '("-slave")
      emms-player-mpg321-command-name "mpg123"
      emms-player-list '(emms-player-mplayer
                         emms-player-mplayer-playlist
                         emms-player-mpg321
                         emms-player-ogg123))

(defun emms-player-mplayer-volume-up ()
  "Depends on mplayer's -slave mode"
  (interactive)
  (process-send-string emms-player-simple-process-name "volume 1\n"))

(defun emms-player-mplayer-volume-down ()
  "Depends on mplayer's -slave mode"
  (interactive)
  (process-send-string emms-player-simple-process-name "volume -1\n"))

(define-key emms-playlist-mode-map (kbd ">") 'emms-player-mplayer-volume-up)
(define-key emms-playlist-mode-map (kbd "<") 'emms-player-mplayer-volume-down)

(provide 'starter-kit-emms)
