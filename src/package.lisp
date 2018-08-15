;;;; -*- mode: lisp -*-

(defpackage #:ru.bazon.cl-bazon
  (:nicknames #:cl-bazon)
  (:use
   #:cl)
  (:export
   
   ;function
   #:->
   #:->>
   #:macro-wrap
   #:compose
   #:flip
   #:partial

   ;list
   #:list?

   ;alist
   #:assoc-ref

   ;sequence
   #:seq/split

   ;shell
   run/string
   run/lines
   ))
