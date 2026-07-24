(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 1)
      result
      (iter (- i 1) (/ (n (- i 1)) (+ (d (- i 1)) result)))))
  (iter k (/ (n k) (d k))))


(define (euler k)
  (+ 2 
     (cont-frac (lambda (i) 1.0)
                (lambda (i)
                  (if (= (remainder i 3) 2)
                    (* 2 (/ (+ i 1) 3))
                    1))
                k)))

(euler 1000)
