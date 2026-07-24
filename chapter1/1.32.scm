; recursive
(define (accumulate-r combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate-r combiner null-value term (next a) next b))))

; iterative
(define (accumulate-i combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (product-r term a next b)
  (accumulate-r * 1 term a next b))

(define (product-i term a next b)
  (accumulate-i * 1 term a next b))

(define (sum-r term a next b)
  (accumulate-r + 0 term a next b))

(define (sum-i term a next b)
  (accumulate-i + 0 term a next b))

(define (inc i) (+ 1 i))
(define (identity x) x)
(define (cube x) (* x x x))

(define (factorial-r n)
  (product-r identity 1 inc n))

(define (factorial-i n)
  (product-i identity 1 inc n))


(factorial-r 7)
(factorial-i 7)

(sum-r cube 1 inc 3)
(sum-i cube 1 inc 3)
