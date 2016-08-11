;;;; -*- mode: lisp -*-

(defsystem :cl-bazon
  :name "cl-bazon"
  :author "Azamat S. Kalimoulline <turtle@bazon.ru>"
  :licence "Lessor Lisp General Public License"
  :version "0.0.1.0"
  :description "CL Bazon"
  :depends-on ()
  :components ((:module "src"
                        :components
                        ((:file "package")
                         (:file "core" :depends-on ("package"))))))