(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

;(define (print-rat x)
;  (newline) 
;  (display (numer x))
;  (display "/")
;  (display (denom x))
;)

;(define one-half (make-rat 1 2))
;(print-rat one-half)

;(define (cons x y)
;  (define (dispatch m)
;    (cond 
;      ((= m 0) x)
;      ((= m 1) y)
;      (else (error "Argument not 0 or 1: CONS" m)))
;  )
;  dispatch
;)

(define (car z) (z 0))
(define (cdr z) (z 1))

(define (cons x y)
  (lambda (m) (m x y))
)

(define (car z)
  (z (lambda (p q) p))
)

; exercise 2.4
(define (cdr z)
  (z (lambda (p q) q))
)

; the real trick is understanding the substitution tho
; (car (cons x y))
; (car (lambda (m) (m x y))
; ((lambda (m) (m x y)) (lambda (p q) p))
; ((lambda (p q) p) x y)
; ((lambda (x y) x))

