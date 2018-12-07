;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defun pget (item plist &key (key #'identity) (vkey #'identity) (test #'eql))
  (let ((prop (car plist))
        (value (funcall vkey (cdr plist))))
    (if (funcall test item (funcall key prop))
        value
        (if (not prop)
            nil
            (pget item (cddr plist) :key key :vkey vkey :test test)))))

(defun pget-first (item plist &key (key #'identity) (test #'eql))
  (pget item plist :key key :vkey #'car :test test))

(defun pget-rest (item plist &key (key #'identity) (test #'eql))
  (pget item plist :key key :test test))

