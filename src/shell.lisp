;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defun run/string (command &key input)
  (let ((output-string (make-array '(0) :element-type 'character
                                        :fill-pointer 0
                                        :adjustable t)))
    (with-output-to-string (string-stream output-string)
      (let* ((process (uiop:launch-program command
                                           :input input
                                           :output string-stream
                                           :error-output string-stream))
             (exit-code (uiop:wait-process process)))
        (values output-string exit-code)))))

(defun run/lines (command &key input)
  (multiple-value-bind (output-string exit-code)
      (run/string command :input input)
    (let ((output-lines (with-input-from-string (is output-string)
                          (loop
                            for line = (read-line is nil nil)
                            while line
                            collect line))))
      (values output-lines exit-code))))

(defun exit (&optional code)
  #+allegro (excl:exit code)
  #+clisp (#+lisp=cl ext:quit #-lisp=cl lisp:quit code)
  #+cmu (ext:quit code)
  #+cormanlisp (win32:exitprocess code)
  #+gcl (lisp:bye code)                     ; XXX Or is it LISP::QUIT?
  #+lispworks (lw:quit :status code)
  #+lucid (lcl:quit code)
  #+sbcl (sb-ext:exit :code code)
  ;; This group from Maxima
  #+kcl (lisp::bye)                         ; XXX Does this take an arg?
  #+scl (ext:quit code)                     ; XXX Pretty sure this *does*.
  #+ (or openmcl mcl) (ccl::quit)
  #+abcl (cl-user::quit)
  #+ecl (si:quit)
  ;; This group from <hebi...@math.uni.wroc.pl>
  #+poplog (poplog::bye)                    ; XXX Does this take an arg?
  #- (or allegro clisp cmu cormanlisp gcl lispworks lucid sbcl
         kcl scl openmcl mcl abcl ecl)
  (error 'not-implemented :proc (list 'quit code)))
