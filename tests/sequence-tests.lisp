;;;; -*- mode: lisp -*-

(in-package #:cl-bazon-tests)

(def-suite cl-bazon-tests.sequence)
(in-suite cl-bazon-tests.sequence)

(test seq/split-simple-one-delimiter
  (is (equal '("This" "is" "a" "test") (seq/split "This is a test" #\Space))))

(test seq/split-simple-delimiter-list
  (is (equal '("This" "is" "a" "" "es" "") (seq/split "This is a test" '(#\Space #\t)))))

(test seq/split-simple-one-delimiter-empty-subseqs
  (is (equal '("This" "is" "a" "test")
             (seq/split "This is  a  test" #\Space :remove-empty-subseqs t))))

(test seq/split-simple-delimiter-list-empty-subseqs
  (is (equal '("This" "is" "a" "es")
             (seq/split "This is a test" '(#\Space #\t) :remove-empty-subseqs t))))

(test seq/start-with-str
  (is (seq/starts-with-p "ABC" "ABC")))

(test seq/start-with-str-not
  (is (not (seq/starts-with-p "ABC" "ABCD"))))

(test seq/start-with-list
  (is (seq/starts-with-p '(1 2 3) '(1 2 3))))

(test seq/start-with-list-not
  (is (not (seq/starts-with-p '(1 2 3) '(1 2 3 4)))))
