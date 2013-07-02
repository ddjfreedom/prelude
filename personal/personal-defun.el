(require 'cl)

(defconst ddj/homework-dir
  (expand-file-name "~/Documents/Homework")
  "Homework directory")

(defvar ddj/courses-list
  "A property list from course number to corresponding directory")

(setplist 'ddj/courses-list
            (mapcan (lambda (dir)
                      (list dir (car (directory-files ddj/homework-dir
                                                      t
                                                      (format ".*%s.*" dir)))))
                    '(6331 6341 6431 6001)))

(defun ddj/find-homework (num course)
  (interactive "nHomework number: \nnHomework %s for course: ")
  (let* ((dir (get 'ddj/courses-list course))
         (old (car (directory-files dir t (format "%d\\.tex$" (- num 1)))))
         (filename (replace-regexp-in-string (format "%d\\.tex$" (- num 1))
                                             (format "%d.tex" num)
                                             old))
         (file (car (directory-files dir t filename))))
    (if (null file)
        (progn (find-file (expand-file-name filename dir))
               (when (not (null old))
                 (insert-file old)))
      (find-file file))))

(provide 'personal-defun)
