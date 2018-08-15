;;;; -*- mode: lisp -*-

(in-package #:cl-bazon-tests)

(def-suite cl-bazon-tests.sequence)
(in-suite cl-bazon-tests.sequence)

(test seq/split-simple-one-delimiter
  (is (equal '("This" "is" "a" "test") (seq/split "This is a test" #\Space))))

(test seq/split-simple-delimiter-list
  (is (equal '("This" "is" "a" "" "es" "") (seq/split "This is a test" '(#\Space #\t)))))
