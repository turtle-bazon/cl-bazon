;;;; -*- mode: lisp -*-

(defsystem :cl-bazon
  :name "cl-bazon"
  :author "Azamat S. Kalimoulline <turtle@bazon.ru>"
  :licence "Lessor Lisp General Public License"
  :version "0.0.1.3"
  :description "CL Bazon"
  :depends-on (split-sequence
               uiop)
  :components ((:module "src"
                        :components
                        ((:file "package")
                         (:file "function"
                          :depends-on ("package"))
                         (:file "list"
                          :depends-on ("package"))
                         (:file "alist"
                          :depends-on ("package"))
                         (:file "plist"
                          :depends-on ("package"))
                         (:file "sequence"
                          :depends-on ("package"
                                       "list"))
                         (:file "string"
                          :depends-on ("package"))
                         (:file "shell"
                          :depends-on ("package")))))
  :in-order-to ((test-op (test-op cl-bazon-tests)))
  :perform (test-op :after (op c)
                    (funcall
                     (intern (symbol-name '#:run-cl-bazon-tests)
                             :cl-bazon-tests))))
