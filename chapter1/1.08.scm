(define (square x) (* x x))

(define (qbrt-iter guess x old-guess) 
  (if (good-enough? guess old-guess)
    guess
    (qbrt-iter (improve guess x)
               x
               guess)))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess old-guess)
  (< 
    ( / (abs (- guess old-guess))
        guess)
     0.0000001))

(define (qbrt x)
  (qbrt-iter 1.0 x 0))

(qbrt 27)
