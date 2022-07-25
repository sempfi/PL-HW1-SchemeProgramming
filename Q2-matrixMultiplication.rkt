#lang scheme

; Utillity function: transpose
; Returns the transpose of the matrix.
(define (transpose matrix)
	(apply map list matrix)
)

; Subroutine function: multiply-matrix-subroutine;
;	Returns the product of two matrices. Takes a row from the matrix-1 and multiples it to
;	all rows of matrix-2, and adds the resulted vector to get the corresponding element.
(define (multiply-matrix-subroutine matrix-1 matrix-2)
	(map (lambda (row-1)
        (map (lambda (row-2)
            (apply + (map * row-1 row-2))
        	)
        matrix-2)
	)
   matrix-1)
)

; Main function;
; 	Transposes the second matrix and passes it to the subroutine along with the first matrix.
;	Returns the matrix returned by the subroutine.
(define (multiply-matrix matrix-1 matrix-2)
	(multiply-matrix-subroutine matrix-1 (transpose matrix-2))
)

(define matrix-1 '((0 1 2 3 4)(5 6 7 8 9)(10 11 12 13 14)(15 16 17 18 19)))
(define matrix-2 '((0 21 0)(0 24 25)(26 27 28)(29 0 31)(32 33 34)))

(display "The first matrix is: ")
(display matrix-1)
(newline)
(display "The second matrix is: ")
(display matrix-2)
(newline)
(display "The product equals to: ")
(display (multiply-matrix matrix-1 matrix-2))
