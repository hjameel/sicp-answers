#lang racket
; Exercise 1.3

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

(define (sum-of-squares-of-larger-two-numbers x y z)
  (cond ((and (<= x y) (<= x z)) (sum-of-squares y z))
         ((<= y z) (sum-of-squares x z))
         (else (sum-of-squares x y))))

; Tests
(= (sum-of-squares-of-larger-two-numbers 1 2 3) (+ 4 9))
(= (sum-of-squares-of-larger-two-numbers -1 -2 -3) (+ 1 4))
(= (sum-of-squares-of-larger-two-numbers 3 3 3) (+ 9 9))
(= (sum-of-squares-of-larger-two-numbers 0 3 3) (+ 9 9))
(= (sum-of-squares-of-larger-two-numbers 3 0 3) (+ 9 9))
(= (sum-of-squares-of-larger-two-numbers 3 3 0) (+ 9 9))
(= (sum-of-squares-of-larger-two-numbers 100 3 3) (+ 10000 9))
(= (sum-of-squares-of-larger-two-numbers 3 100 3) (+ 10000 9))
(= (sum-of-squares-of-larger-two-numbers 3 3 100) (+ 10000 9))
