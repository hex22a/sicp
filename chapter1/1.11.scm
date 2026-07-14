; Recursive
(define (fr n)
  (if (< n 3)
    n
    (+ (fr (- n 1)) (fr (- n 2)) (fr (- n 3)))))

(fr 4)
