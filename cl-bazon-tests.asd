;;;; -*- mode: lisp -*-

(asdf:defsystem :cl-bazon-tests
  :name "cl-bazon-tests"
  :author "Azamat S. Kalimoulline <turtle@bazon.ru>"
  :licence "Lessor Lisp General Public License"
  :version "0.0.1.2"
  :description "CL Bazon tests"
  :depends-on (:cl-bazon :fiveam)
  :components ((:module "tests"
                :components ((:file "package")
                             (:file "function-tests"
                              :depends-on ("package"))
                             (:file "list-tests"
                              :depends-on ("package"))
                             (:file "alist-tests"
                              :depends-on ("package"))
                             (:file "plist-tests"
                              :depends-on ("package"))
                             (:file "string-tests"
                              :depends-on ("package"))
                             (:file "sequence-tests"
                              :depends-on ("package"))))))
