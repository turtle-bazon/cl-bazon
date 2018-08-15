;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defmacro seq/split (seq delims
                     &optional &key
                                 (key #'identity)
                                 (test #'eq test-defined?)
                                 (test-not nil test-not-defined?))
  (when (and test-defined? test-not-defined?)
    (error ":TEST and :TEST-NOT were both supplied."))
  (let ((test-part (cond
                     ((and test-defined? (not test-not-defined?)) `(:test ,test))
                     ((and (not test-defined?) test-not-defined?) `(:test-not ,test-not))
                     (t '()))))
    (if (list? delims)
        `(split-sequence:split-sequence-if
          (lambda (element)
            (member element ,delims :key ,key ,@test-part))
          ,seq)
        `(split-sequence:split-sequence ,delims ,seq :key ,key ,@test-part))))
