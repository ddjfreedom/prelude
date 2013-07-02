(require 'undo-tree)
(global-undo-tree-mode)

(require 'powerline)
(powerline-default-theme)

(eval-after-load 'flycheck
  '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(provide 'misc-init)
