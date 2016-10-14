; tree recursion
(define (fib n)
  (if (or (= n 0) (= n 1)) 
    n
    (+ (fib (- n 1)) (fib (- n 2)))
  )
)

; iterative recursion
(define (fib2 n)
  (define (iter a b count)
    (if (= count 0)
      b
      (iter (+ a b) a (- count 1))
    )
  )
  (iter 1 0 n)
)

; even fibonacci numbers
(define (even-fib n)
  (define (next k)
    (if (> k n) 
      '()
      (let ((f (fib k)))
      (if (even? f) 
	(cons f (next (+ k 1)))
	(next (+ k 1))
      )
      )
    )
  )
  (next 0)
)

; create a range (a list of the numbers from 0 to n-1)
(define (range n)
  (define (iter count nums)
    (if (= count (- n 1)) 
      nums
      (iter (+ count 1) (append nums (list (+ count 1))))
    )
  )
  (iter 0 '(0))
)

; example usage of range
; (display (map (lambda (x) (* x x)) (range 10)))
