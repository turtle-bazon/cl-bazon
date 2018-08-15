;;;; -*- mode: lisp -*-

(in-package #:cl-bazon-tests)

(def-suite cl-bazon-tests.alist)
(in-suite cl-bazon-tests.alist)

(test assoc-ref
  (is (= 2 (assoc-ref :b '((:a . 1) (:b . 2))))))
