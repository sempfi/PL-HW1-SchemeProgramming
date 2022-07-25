#lang scheme

; Utillity function: reduce.
; Description:
;   takes two arguments, namely:
;     function: the operation that we wish to apply on a list;
;     lst: the list we wish to apply the operation on.
;   it first applies the function on the first two members and adds the result in the place
;   of the first member, and does this recursively until the list ends.
(define (reduce function lst)
  (cond
    ((or (null? lst) (null? (cdr lst))) lst)
    (else (reduce function (cons (function (car lst) (cadr lst)) (cddr lst))))
  )
)

; returns a vector where each element is the sum of its corresponding row. 
(define (row-sum matrix)
  (map car (map (lambda (row) (reduce + row)) matrix))
)

; returns a vector where each element is the sum of its corresponding column. 
(define (column-sum matrix)
  (car (reduce (lambda (row-1 row-2) (map + row-1 row-2)) matrix))
)


; some test
(define matrix '((0 1 2 3 4)(5 6 7 8 9)(0 1 2 3 4)(5 6 7 8 9)))
(display "The matrix is: ")
(display matrix)
(newline)
(display "Sum of rows: ")
(display (row-sum matrix))
(newline)
(display "Sum of columns: ")
(display (column-sum matrix))
(newline)
