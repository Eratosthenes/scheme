; range of numbers from 0 to n-1
(define (range n)
  (define (iter count nums)
    (if (= count (- n 1)) 
      nums
      (iter (+ count 1) (append nums (list (+ count 1))))
    )
  )
  (iter 0 '(0))
)

; eg, (filter odd? (range 10))
(define (filter predicate seq)
  (cond 
    ((null? seq) 
      '())
    ((predicate (car seq)) 
      (cons (car seq) (filter predicate (cdr seq))))
    (else (filter predicate (cdr seq))))
)

; an accumulator
(define (accumulator op init seq)
  (if (null? seq) 
    init
    (op (car seq) (accumulator op init (cdr seq)))
  )
)

; accumulator in action: 
; (accumulator + 0 '(1 2 3))
; (+ 1 (accumulator + 0 '(2 3)))
; (+ 1 (+ 2 (accumulator + 0 ('3))))
; (+ 1 (+ 2 (+ 3 (accumulator + 0 '()))))
; (+ 1 (+ 2 (+ 3 0)))
; (+ 1 (+ 2 3))
; (+ 1 5)
; 6

; accum wrapper
(define (accum op seq) (accumulator op (car seq) seq))
    
(define (fib n)
  (define (iter a b count)
    (if (= count n)
      a
      (iter (+ a b) a (+ count 1))
    )
  )
  (iter 0 1 0)
)
      
