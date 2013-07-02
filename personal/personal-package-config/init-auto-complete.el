(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(setq ac-comphist-file (expand-file-name "ac-comphist.dat" prelude-savefile-dir))

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-flyspell-workaround)
