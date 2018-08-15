;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defmacro assoc-ref (item alist &key key test)
  (let* ((rest-args (if test
                        `(:key ,key :test ,test)
                        `(:key ,key))))
    `(rest (assoc ,item ,alist ,@rest-args))))
