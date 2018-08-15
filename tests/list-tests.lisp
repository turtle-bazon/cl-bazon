;;;; -*- mode: lisp -*-

(in-package #:cl-bazon-tests)

(def-suite cl-bazon-tests.list)
(in-suite cl-bazon-tests.list)

(test list?-list
  (is (list? '())))

(test list?-number
  (is-false (list? 1)))
