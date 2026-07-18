(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (i-fast-prod a b)
  (i-fast-prod-iter a b 0))

(define (i-fast-prod-iter a b i)
  (cond ((= b 0) i)
        ((even? b) (i-fast-prod-iter (double a) (halve b) i))
        (else (i-fast-prod-iter a (- b 1) (+ i a)))))

(i-fast-prod 9 9)
