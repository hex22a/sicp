(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10000)
    (report-prime (- (runtime) start-time) n)
    #f))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
  #t)

(timed-prime-test 11)
; (timed-prime-test 1000000021)
; (timed-prime-test 10000000019)
; (timed-prime-test 10000000033)
; (timed-prime-test 10000000061)
; (timed-prime-test 100000000003)
; (timed-prime-test 100000000019)
; (timed-prime-test 100000000057)
; (timed-prime-test 1000000000039)
; (timed-prime-test 1000000000061)
; (timed-prime-test 100000000000097)

; Alyssa's version requires calculating exp before taking a reminder and that can be a very large number
; Original version is similar to fastexp however it takes a reminder on every step so after log(n) steps we will already have an answer
