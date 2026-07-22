(define (gcde a b)
  (if (= b 0)
    a
    (gcde b (remainder a b))))

(gcde 206 40)
