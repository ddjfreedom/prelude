(setq el-get-dir (expand-file-name "el-get" prelude-dir))
(add-to-list 'load-path (expand-file-name "el-get" el-get-dir))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-min))
      (search-forward "\n(let")
      (eval-defun nil))))

(setq el-get-sources '())

(setq personal-el-get-packages
      (append '("el-get" "org-mode")
              (when (bound-and-true-p el-get-sources)
                (mapcar 'el-get-source-name el-get-sources))))

(el-get 'sync personal-el-get-packages)

(provide 'el-get-init)
