(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         ; instad of calling expmod once we're calling it twice now
         ; which grows exponentially effectively cancelling O(log(n)) and turning it into O(n) 
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m)) m))
        (else
          (remainder (* base (expmod base (- exp 1) m)) m))))
