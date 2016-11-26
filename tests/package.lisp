;;;; -*- mode: lisp -*-

(defpackage #:ru.bazon.cl-bazon-tests
  (:nicknames #:cl-bazon-tests)
  (:use
   #:cl
   #:cl-bazon
   #:fiveam))

(in-package #:cl-bazon-tests)

(defun run-cl-bazon-tests ()
  (describe (fiveam:run! 'cl-bazon-tests.core)))
