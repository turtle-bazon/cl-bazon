;;;; -*- mode: lisp -*-

(in-package #:cl-bazon-tests)

(def-suite cl-bazon-tests.core)
(in-suite cl-bazon-tests.core)

(test simple->
  (is (= 1 (-> 1 +))))

(test simple-arg->
  (is (= 3 (-> 1 (+ 2)))))

(test macro->
  (is (= 2 (-> 2 or))))

(test macro-arg->
  (is (= 2 (-> 2 (or 4)))))

(test simple->>
  (is (= 1 (-> 1 +))))

(test simple-arg->>
  (is (= 3 (-> 1 (+ 2)))))

(test macro->
  (is (= 2 (->> 2 or))))

(test macro-arg->>
  (is (= 3 (->> 2 (or 3)))))

(test ->-sharp-quote
  (is (= 1 (-> 1 #'+))))

(test ->-sharp-quote-arg
  (is (= 3 (-> 1 (#'+ 2)))))

(test ->>-sharp-quote
  (is (= 1 (->> 1 #'+))))

(test ->>-sharp-quote-arg
  (is (= 3 (->> 1 (#'+ 2)))))

(test ->-lambda
  (is (= 3 (-> 1 (lambda (x) (+ x 2))))))

(test ->-lambda-args
  (is (= 3 (-> 1 ((lambda (x y) (+ x y)) 2)))))

(test ->>-lambda
  (is (= 3 (->> 1 (lambda (x) (+ x 2))))))

(test ->>-lambda-args
  (is (= 3 (->> 1 ((lambda (x y) (+ x y)) 2)))))
