(define (prod a b)
  (if (= b 0)
    0
    (+ a (prod a (- b 1)))))

(prod 3 2)

;;;;

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-prod a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-prod (double a) (halve b)))
        (else (+ a (fast-prod a (- b 1))))))

(fast-prod 6 7)
