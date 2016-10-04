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

