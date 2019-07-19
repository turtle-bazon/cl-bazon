;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defmacro seq/split (seq delims
                     &optional &key
                                 (key nil key-defined?)
                                 (test nil test-defined?)
                                 (test-not nil test-not-defined?)
                                 (remove-empty-subseqs nil))
  (when (and test-defined? test-not-defined?)
    (error ":TEST and :TEST-NOT were both supplied."))
  (let ((key-part (when key-defined?
                    `(:key ,key)))
        (test-part (cond
                     ((and test-defined? (not test-not-defined?)) `(:test ,test))
                     ((and (not test-defined?) test-not-defined?) `(:test-not ,test-not))
                     (t '()))))
    (if (list? delims)
        `(split-sequence:split-sequence-if
          (lambda (element)
            (member element ,delims ,@key-part ,@test-part))
          ,seq :remove-empty-subseqs ,remove-empty-subseqs)
        `(split-sequence:split-sequence
          ,delims ,seq :remove-empty-subseqs ,remove-empty-subseqs
          ,@key-part ,@test-part))))

(defun seq/starts-with-p (seq1 seq2)
  "Determines whether `seq1` starts witch `seq2`"
  (let ((p (search seq2 seq1)))
    (and p (= 0 p))))

(defun seq/ends-with-p (seq1 seq2)
  "Determines wheter `seq1` ends with `seq2`"
  (let ((p (mismatch seq2 seq1 :from-end t)))
    (or (not p) (= 0 p))))
