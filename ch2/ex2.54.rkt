#lang racket
;; Exercise 2.54

(define (equal? a b)
  (if (pair? a)
    (eq? (car a) (car b))
    (eq? a b)))

;; Tests
(equal? 1 1)
(equal? '(1) '(1))
