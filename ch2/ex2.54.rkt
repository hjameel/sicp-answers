#lang racket
;; Exercise 2.54

(define (equal? a b)
  (if (and (pair? a) (pair? b))
    (eq? (car a) (car b))
    (eq? a b)))

;; Tests
(equal? 1 1)
(equal? '(1) '(1))
(not (equal? '(1) 1))
