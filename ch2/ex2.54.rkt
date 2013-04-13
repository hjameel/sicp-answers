#lang racket
;; Exercise 2.54

(define (equal? a b)
  (if (and (pair? a) (pair? b))
    (if (eq? (car a) (car b))
      (equal? (cdr a) (cdr b))
      false)
    (eq? a b)))

;; Tests
(equal? 1 1)
(not (equal? 1 2))
(equal? '(1) '(1))
(not (equal? '(1) 1))
(not (equal? '(1 2) '(1 1)))
(equal? '(1 1 2) '(1 1 2))
(not (equal? '(1 1 2) '(1 1)))
