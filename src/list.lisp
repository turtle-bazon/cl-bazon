;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defmacro list? (object)
  `(listp ,object))
