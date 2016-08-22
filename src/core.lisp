;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defmacro ->> (initial-form &rest forms)
  (if forms
      (let* ((first-form (first forms)))
        (destructuring-bind (function-call function-args)            
            (if (listp first-form)
                (let ((fname (first first-form))
                      (fargs (rest first-form)))
                  (if (eq fname 'function)
                      (list first-form '())
                      (list fname fargs)))                
                (list first-form '()))
          `(-> (funcall ,@(if (or (listp function-call)
                                  (not (fboundp function-call)))
                              `(,function-call)
                              `(',function-call))
                        ,@function-args ,initial-form)
               ,@(rest forms))))
      initial-form))

(defmacro -> (initial-form &rest forms)
  (if forms
      (let* ((first-form (first forms)))
        (destructuring-bind (function-call function-args)            
            (if (listp first-form)
                (let ((fname (first first-form))
                      (fargs (rest first-form)))
                  (if (eq fname 'function)
                      (list first-form '())
                      (list fname fargs)))                
                (list first-form '()))
          `(-> (funcall ,@(if (or (listp function-call)
                                  (not (fboundp function-call)))
                              `(,function-call)
                              `(',function-call))
                        ,initial-form ,@function-args)
               ,@(rest forms))))
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
