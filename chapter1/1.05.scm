(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

(test 0 (p))
; This won't evaluate. Lisp uses Applicative Evaluation which tries to calculate (p) first
; However p is defined through p so it can't go further and eval test
; If Lisp was using Normal order evaluation (fully expand and reduce) it whould end up with something like
; (if (= 0 0) 0 (p)) which evaluates to 0
