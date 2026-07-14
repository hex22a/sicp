; Recursive
(define (fr n)
  (if (< n 3)
    n
    (+ (fr (- n 1)) (fr (- n 2)) (fr (- n 3)))))

(fr 10)
;230

; Iterative
(define (fi n)
         (fi-iter 0 1 2 n))

(define (fi-iter a b c count) 
  (if (= count 0)
    a
    (fi-iter b c (+ a b c) (- count 1) )))
(fi 10)
;230
