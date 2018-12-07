;;;; -*- mode: lisp -*-

(in-package #:cl-bazon-tests)

(def-suite cl-bazon-tests.plist)
(in-suite cl-bazon-tests.plist)

(test pget-symbols
      (is (= 2 (pget-first :b '(:a 1 :b 2)))))

(test pget-strings
      (is (= 2 (pget-first "b" '("a" 1 "b" 2) :test #'equal))))

(test pget-rest-symbols
      (is (equal '(1 :b 2) (pget-rest :a '(:a 1 :b 2)))))

(test pget-rest-strings
      (is (equal '(1 "b" 2) (pget-rest "a" '("a" 1 "b" 2) :test #'equal))))
