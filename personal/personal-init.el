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

(setq mac-function-modifier 'hyper)

(load-theme 'solarized-dark)

(defvar personal-package-config-dir
  (expand-file-name "personal-package-config" prelude-personal-dir))

(add-to-list 'load-path prelude-personal-dir)
(require 'init-el-get)

(when (file-exists-p personal-package-config-dir)
  (mapc 'load (directory-files personal-package-config-dir 't "^[^#].*el$")))

;; color for highlight-indentation
(require 'highlight-indentation)

(add-hook 'c-mode-common-hook 'highlight-indentation-mode)
(remove-hook 'prelude-c-mode-common-hook 'prelude-c-mode-common-defaults)

(setq show-paren-style 'parenthesis)

(setq slime-default-lisp 'sbcl)

(setq prelude-whitespace nil)

(setq ido-auto-merge-delay-time 99999)

(setq ring-bell-function 'ignore)

(prelude-swap-meta-and-super)

(provide 'personal-init)
;;; personal-init.el ends here
