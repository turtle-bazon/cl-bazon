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

(defmacro macro-wrap (macro-name)
  `(lambda (&rest args)
     (eval (cons (quote ,macro-name) args))))

(defun partial (function &rest args)
  (lambda (&rest more-args)
    (apply function (append args more-args))))

(defmacro partialm (function &rest args)
  `(lambda (&rest more-args)
     (apply ,function (append (list ,@args) more-args))))
