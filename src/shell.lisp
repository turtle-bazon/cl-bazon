;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defun run/string (program &rest arguments)
  (with-output-to-string (string-stream)
    (let ((process (uiop:launch-program (cons program arguments) :output string-stream)))
      (uiop:wait-process process))))

(defun run/lines (program &rest arguments)
  (with-input-from-string (is (apply #'run/string (cons program arguments)))
    (loop
       for line = (read-line is nil nil)
       while line
       collect line)))

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
