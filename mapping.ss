(define (scale-list items factor)
  (if (null? items)
    '()
    (cons (* factor (car items))
    (scale-list (cdr items) factor))
  )
)

