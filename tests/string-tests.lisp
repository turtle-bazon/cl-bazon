;;;; -*- mode: lisp -*-

(in-package #:cl-bazon-tests)

(def-suite cl-bazon-tests.string)
(in-suite cl-bazon-tests.string)

(test string/replace-all-basic
  (is (equal "this is 01 replaces"
             (string/replace-all "this is abcdef replaces" "abcdef" "01"))))
