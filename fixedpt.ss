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

(display (fixed-pt (lambda (x) (+ (cos x) (sin x)))))
(display "\n")
(display (fixed-pt cos))

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
  (define (alt-sqrt x)
    (fixed-pt (lambda (y) (average x (/ x y)))))
  (alt-sqrt 2.0)
)

; straightforward way of doing exercise 1.35
(define (phi2)
  (fixed-pt (lambda (y) (+ 1 (/ 1 y))))
)

(define (square x) (* x x))
(define (avg-damp f) (lambda (x) (average x (f x))))

; a more instructive sqrt
(define (sqrt2 x)
  (fixed-pt (avg-damp (lambda (y) (/ x y))))
)

; derivative
(define (D g)
  (define dx 1e-6)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))
)

(define (cube x) (* x x x))

; newton's method
; use x - g(x)/D(g(x))
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((D g) x))))
)

(define (newton g)
  (fixed-pt (newton-transform g))
)

; use newton's method for y^2 - x = 0 to calculate sqrt of x
; f(y) = y^2 - x
(define (sqrt3 x)
  (newton (lambda (y) (- (square y) x)))
)
