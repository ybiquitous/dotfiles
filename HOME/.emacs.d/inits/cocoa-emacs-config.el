;; http://qiita.com/hayamiz/items/0f0b7a012ec730351678
(setq ns-command-modifier (quote meta))

;; http://qiita.com/aKenjiKato/items/bb20c335eee1612c36e5
(define-key global-map [165] [92])

;; http://rubikitch.com/2016/09/05/visible-bell-macosx-slow
(setq ring-bell-function 'ignore)

;; http://hylom.net/emacs-25.1-ime-flicker-problem
(setq redisplay-dont-pause nil)
