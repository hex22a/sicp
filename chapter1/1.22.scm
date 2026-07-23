(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time) n)
    #f))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
  #t)

(define (search-for-primes-odd p n)
  (cond ((= n 0) (newline))
        ((timed-prime-test p) (search-for-primes-odd (+ p 2) (- n 1)))
        (else (search-for-primes-odd (+ p 2) n))))

(define (search-for-primes p)
  (if (divides? 2 p)
    (search-for-primes-odd (+ p 1) 3)
    (search-for-primes-odd p 3)))

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 10000000)
(search-for-primes 1000000000)
(search-for-primes 100000000000)
(search-for-primes 1000000000000)
(search-for-primes 10000000000000)
