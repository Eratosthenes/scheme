; b^n = b*b^(n-1), and b^0 = 1
(define (expt b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))
  )
)

; iterative recursion
(define (pow b n)
  (define (iter product counter)
    (cond 
      ((= counter 0) 1)
      ((= counter 1) product)
      (else (iter (* product b) (- counter 1)))
    )
  )
  (iter b n)
)

; faster recursion
; b^n = (b^(n/2))^2 if even
; b^n = b*b^(n-1) if odd
(define (square x) (* x x))

(define (pow2 b n)
  (cond 
    ((= 0 n) 1)
    ((even? n) (square (pow2 b (/ n 2))))
    (else (* b (pow2 b (- n 1))))
  )
)

; calculate the remainder of n when divided by q
(define (remainder n q)
  (if (< n q)
    n
    (remainder (- n q) q)
  )
)

