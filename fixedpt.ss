; find the fixed point of a function f
(define (fixed-pt f)
  (define tolerance 0.00001)
  (define (iter-pt f guess)
    (if (< (abs (- (f guess) guess)) tolerance)
      guess
      (iter-pt f (f guess))
    )
  )
  (iter-pt f 1.0)
)

(define (average x y) (/ (+ x y) 2)) 

; definition of sqrt is a y s.t. y^2 = x
; thus y = x/y, so the fixed pt of x/y should work
; however, it oscilates, so to create slower convergence, use
; the fixed pt of avg(y,x/y)
(define (sqrt x)
  (fixed-pt (lambda (y) (average y (/ x y))))
)

; exercise 1.35--kind of a cool way to define golden ratio
; works because avg(2,2/y) is 1+1/y, which is what you want 
; to use as a fixed pt function
(define (phi)
  (define (ratio x)
    (fixed-pt (lambda (y) (average x (/ x y)))))
  (ratio 2.0)
)

(display (fixed-pt (lambda (x) (+ (cos x) (sin x)))))
(display "\n")
(display (fixed-pt cos))
