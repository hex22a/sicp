; recursive
(define (cont-frac-r n d k)
  (if (= k 0)
    (/ (n k) (d k))
    (/ (n (- k 1)) (+ (d (- k 1)) (cont-frac n d (- k 1))))))

; interative
(define (cont-frac-i n d k)
  (define (iter i result)
    (if (= i 1)
      result
      (iter (- i 1) (/ (n (- i 1)) (+ (d (- i 1)) result)))))
  (iter k (/ (n k) (d k))))

(cont-frac-r (lambda (i) 1.0)
             (lambda (i) 1.0)
             10)
(cont-frac-i (lambda (i) 1.0)
             (lambda (i) 1.0)
             11)
