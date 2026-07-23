(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc i) (+ 1 i))
  (define (y k)
    (cond ((or (= k 0) (= k n)) (f (+ a (* k h))))
          ((even? k) (* 2 (f (+ a (* k h)))))
          (else (* 4 (f (+ a (* k h)))))))
  (* (/ h 3) (sum y 0 inc n)))

(simpson cube 0 1 100.0)
(simpson cube 0 1 1000.0)
