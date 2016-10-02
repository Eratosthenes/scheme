; linear recursion (takes linear space)
(define (fact1 n)
  (if (= n 1)
    n
    (* n (fact1 (- n 1)))))

; tail recursion (takes constant space)
(define (fact2 n)

  (define (fact-iter product counter max-count)
    (if (> counter max-count)
      product
      (fact-iter (* product counter) (+ counter 1) max-count)))

  (fact-iter 1 1 n)
)

; tail recursion with lexical scoping
; (makes use of the fact that n is already defined)
(define (fact3 n)
  (define (iter product counter)
    (if (> counter n)
      product
      (iter (* counter product) (+ 1 counter))
    )
  )
  (iter 1 1)
)

; note: an example of tree recursion would be a fibonacci function
