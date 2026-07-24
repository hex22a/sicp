(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (filtered-accumulate combiner null-value filter? term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (if (filter? a)
        (iter (next a) (combiner result (term a)))
        (iter (next a) result)))
    )
  (iter a null-value))

(define (prime? p)
  (fast-prime? p 100))

(define (sum-prime term a next b)
  (filtered-accumulate + 0 prime? term a next b))

(define (inc i) (+ 1 i))
(define (identity x) x)

(sum-prime square 2 inc 10)

(define (product-coprimes n)
  (define (coprime? i) (= (gcd i n) 1))
  (filtered-accumulate * 1 coprime? identity 1 inc n))

(product-coprimes 10)
