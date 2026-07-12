(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(define (square x) (* x x))

; (define (sqrt-iter guess x) 
;   (new-if (good-enough? guess x)
;     guess
;     (sqrt-iter (improve guess x)
;                x)))
; The code above result in infinite recursion due to Applicative Order Evaluation
; If is a special case where interpreter always evaluates predicate first and based on that it evaluates then- or else-
; Cond on the other hand goes through every case and evaluates clauses when it fist hits #t. if none is found it falls back to else-
; In our case most likely our initial guess would never be good enough so it will trigger evaluating sqrt-iter over and over again

(define (sqrt-iter guess x) 
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

(new-if (= 1 1) 0 5)
(new-if (= 2 3) 0 5)
(my-sqrt 9)
(sqrt 9)
