;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defun run/string (program &rest arguments)
  (with-output-to-string (string-stream)
    (let ((process (uiop:launch-program (cons program arguments) :output string-stream)))
      (uiop:wait-process process))))

(defun run/lines (program &rest arguments)
  (seq/split (apply #'run/string (cons program arguments)) '(#\Return #\NewLine)))
