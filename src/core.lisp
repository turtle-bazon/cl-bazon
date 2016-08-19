;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defmacro ->> (initial-form &rest forms)
  (if forms
      (let* ((first-form-pc (first forms))
             (first-form (if (listp first-form-pc)
                             first-form-pc
                             (list first-form-pc)))
             (rest-forms (rest forms)))
        `(->> ,(append first-form (list initial-form))
             ,@rest-forms))
      initial-form))

(defmacro -> (initial-form &rest forms)
  (if forms
      (let* ((first-form-pc (first forms))
             (first-form (if (listp first-form-pc)
                             first-form-pc
                             (list first-form-pc)))
             (rest-forms (rest forms)))
        `(-> ,(cons (first first-form) (cons initial-form (rest first-form)))
             ,@rest-forms))
      initial-form))

(defmacro fn (&rest forms)
  `(lambda ,@forms))

(defmacro macro-wrap (macro-symbol)
  `(lambda (&rest args)
     (eval (cons ,macro-symbol args))))

(defun compose (function &rest more-functions)
  (reduce (lambda (f1 f2)
            (lambda (&rest args)
              (multiple-value-call f1 (apply f2 args))))
          more-functions
          :initial-value function))

(define-compiler-macro compose (function &rest more-functions)
  (reduce (lambda (f1 f2)
            `(lambda (&rest args)
               (multiple-value-call ,f1 (apply ,f2 args))))
          more-functions
          :initial-value function))

(defun flip (function)
  (lambda (&rest args)
    (apply function (reverse args))))

(define-compiler-macro flip (function)
  `(lambda (&rest args)
     (apply ,function (reverse args))))

(defun partial (function &rest args)
  (lambda (&rest more-args)
    (apply function (append args more-args))))

(define-compiler-macro partial (function &rest args)
  `(lambda (&rest more-args)
     (apply ,function (append (list ,@args) more-args))))
