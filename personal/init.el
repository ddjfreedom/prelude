;; default frame setup
(setq default-frame-alist
      (nconc default-frame-alist
             '((fullscreen . fullboth))))

;; font setting
(set-face-attribute 'default nil :font "Menlo 14")
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "WenQuanYi Micro Hei Mono" :size 16)))

(unless (and (fboundp 'server-running-p)
             (server-running-p))
  (server-start))

(setq c-basic-offset 4)
(setq c-default-style "k&r")

(mapc (lambda (elem) (add-to-list 'completion-ignored-extensions elem))
      '(".synctex.gz" ".png" ".pdf"))

;; stop flyspell-mode from using M-TAB
(setq flyspell-use-meta-tab nil)

(prelude-ensure-module-deps
  '(auto-complete idle-highlight-mode iy-go-to-char multiple-cursors powerline
                  smart-forward header2 markdown-mode highlight-indentation))

(load-theme 'solarized-dark)

(defvar personal-package-config-dir
  (expand-file-name "package-config" prelude-personal-dir))

(add-to-list 'load-path prelude-personal-dir)
(require 'el-get-init)

(when (file-exists-p personal-package-config-dir)
  (mapc 'load (directory-files personal-package-config-dir 't "^[^#].*el$")))

;; color for highlight-indentation
(require 'highlight-indentation)

(add-hook 'c-mode-common-hook 'highlight-indentation-mode)
(remove-hook 'prelude-c-mode-common-hook 'prelude-c-mode-common-defaults)

(setq show-paren-style 'parenthesis)

(setq slime-default-lisp 'sbcl)

(setq ido-auto-merge-delay-time 99999)

(setq ring-bell-function 'ignore)

(prelude-swap-meta-and-super)

(require 'powerline)
(powerline-default-theme)

(eval-after-load 'flycheck
  '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(eval-after-load 'haskell-mode
  (progn
    (setq haskell-literate-default "tex")))

;;; init.el ends here
