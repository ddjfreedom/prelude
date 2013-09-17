(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "s-f") 'ido-find-file)
(global-set-key (kbd "s-b") 'ido-switch-buffer)

(dolist (mode-hook '(lisp-mode-hook emacs-lisp-mode-hook c-mode-common-hook))
  (add-hook mode-hook
            '(lambda () (local-set-key [return] 'newline-and-indent))))

;; C-z prefix keys
(global-unset-key "\C-z")
(global-set-key "\C-zc" 'copy-to-register)
(global-set-key "\C-zi" 'insert-register)
(global-set-key (kbd "C-z <SPC>")  'point-to-register)
(global-set-key "\C-zj" 'jump-to-register)
(global-set-key "\C-zw" 'window-configuration-to-register)
(global-set-key "\C-zf" 'frame-configuration-to-register)
(global-set-key "\C-zr" 'nrepl-jack-in)

(global-set-key (kbd "H-SPC") 'set-mark-command)

(global-unset-key (kbd "s-z"))

;; remove keybinding C-c w to prelude-swap-meta-and-super
(define-key prelude-mode-map "\C-cw" nil)

(require 'smart-forward)
(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)

(key-chord-define-global "ff" 'jump-char-forward)
(key-chord-define-global "dd" 'jump-char-backward)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "H-<") 'mc/mark-all-like-this)
(global-set-key (kbd "H->") 'mc/mark-all-in-region)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
