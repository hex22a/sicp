(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(fast-expt 10 2)

;;;;

(define (i-fast-expt b n)
  (i-fast-expt-iter b n 1))

(define (i-fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (i-fast-expt-iter (square b) (/ n 2) a))
        (else (i-fast-expt-iter b (- n 1) (* a b)))))

(i-fast-expt 2 10)
