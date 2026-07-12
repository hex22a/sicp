(define (square x) (* x x))
(define (sum-of-squares a b) (+ (square a) (square b)))

(define (solution a b c) (cond ((= a (min a b c)) (sum-of-squares b c))
                               ((= b (min a b c)) (sum-of-squares a c))
                               ((= c (min a b c)) (sum-of-squares a b))))

(solution 1 2 3)
