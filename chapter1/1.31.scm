; recursive
(define (product-r term a next b)
  (if (> a b)
    1
    (* (term a)
       (product-r term (next a) next b))))

; iterative
(define (product-i term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (inc i) (+ 1 i))
(define (identity x) x)

(define (factorial-r n)
  (product-r identity 1 inc n))

(define (factorial-i n)
  (product-i identity 1 inc n))

(factorial-r 7)
(factorial-i 7)

(define (pi-term-numerator x) (* (* 2 x) (* 2 x)))
(define (pi-term-denominator x) (* (- (* 2 x) 1) (+ (* 2 x) 1)))

(define (pi n)
  (* 2.0 
     (/ (* (product-i pi-term-numerator 1 inc n))
        (* (product-i pi-term-denominator 1 inc n)))))

(pi 100)
(pi 1000)
(pi 10000)
