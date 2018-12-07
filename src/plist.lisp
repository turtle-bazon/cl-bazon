;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defun pget (item plist &key (key #'identity) (test #'eql))
  (let ((prop (car plist))
        (value (cadr plist)))
    (if (funcall test item (funcall key prop))
        value
        (if (not prop)
            nil
            (pget item (cddr plist) :key key :test test)))))
