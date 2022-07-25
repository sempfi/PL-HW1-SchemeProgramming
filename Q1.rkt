#lang scheme

(define node "node")
(define leaf "leaf")

(define (tree-sum tree)
  (cond
    ((eqv? (car tree) 'leaf) (cadr tree))
    (else (+ (tree-sum (cadr tree)) (tree-sum (caddr tree))))
   )
)

(define tree '(node (leaf 1)(node (leaf 2)(leaf 3))))

(display "The tree is: ")
(display tree)
(newline)
(display "The sum is: ")
(display (tree-sum tree))
