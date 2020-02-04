;;;; -*- mode: lisp -*-

(in-package #:ru.bazon.cl-bazon)

(defun exec/sync (command &key input output)
  (let ((input (cond
                 ((stringp input) (make-string-input-stream input))
                 ((null input) (make-string-input-stream ""))
                 (t input)))
        (string-output? (null output))
        (output (cond
                  ((null output) (make-string-output-stream))
                  (t output))))
    (let* ((process (uiop:launch-program
                     command
                     :input input
                     :output output
                     :error-output output))
           (exit-code (uiop:wait-process process)))
      (values (when string-output? (get-output-stream-string output)) exit-code))))

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
