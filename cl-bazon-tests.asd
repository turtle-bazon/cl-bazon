;;;; -*- mode: lisp -*-

(asdf:defsystem :cl-bazon-tests
  :name "cl-bazon-tests"
  :author "Azamat S. Kalimoulline <turtle@bazon.ru>"
  :licence "Lessor Lisp General Public License"
  :version "0.0.1.0"
  :description "CL Bazon tests"
  :depends-on (:cl-bazon :fiveam)
  :components ((:module "tests"
                        :components ((:file "package")
                                     (:file "core-tests"
                                            :depends-on ("package"))))))
