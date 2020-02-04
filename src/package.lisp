;;;; -*- mode: lisp -*-

(defpackage #:ru.bazon.cl-bazon
  (:nicknames #:cl-bazon)
  (:use
   #:cl)
  (:export
   
   ;;function
   #:->
   #:->>
   #:macro-wrap
   #:compose
   #:flip
   #:partial

   ;;list
   #:list?

   ;;alist
   #:assoc-ref

   ;;plist
   #:pget
   #:pget-first
   #:pget-rest

   ;;sequence
   #:seq/split
   #:seq/starts-with-p
   #:seq/ends-with-p

   ;;string
   #:string/replace-all

   ;;shell
   #:exec/sync
   #:exit
   ))
