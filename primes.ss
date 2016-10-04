; calculate the remainder of n when divided by q
(define (remainder n q)
  (if (< n q)
    n
    (remainder (- n q) q)
  )
)

; does a divide b?
(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

; find the lowest divisor of n
(define (lowest-divisor n)
  (define (iter counter)
    (cond 
      ((> (square counter) n) n)
      ((divides? counter n) counter)
      (else (iter (+ counter 1)))
    )
  )
  (iter 2)
)

(define (is-prime? n)
  (= (lowest-divisor n) n)
)

; compute b^n mod(m)
(define (expmod b n m)
  (cond 
    ((= n 0) 1)
    ((even? n) (remainder (square (expmod b (/ n 2) m)) m))
    (else (remainder (* b (expmod b (- n 1) m)) m))
  )
)

; fermat's test
(define (fermat a n)
  (= (expmod a (- n 1) n) 1))

; determine primality using fermat's test
(define (is-prime2? n)
  (define (iter count)
    (cond 
      ((= count n) #t)
      ((not (fermat count n)) #f)
      (else (iter (+ count 1)))
    )
  )
  (iter 2)
)


