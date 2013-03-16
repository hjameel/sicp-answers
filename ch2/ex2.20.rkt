#lang racket
;; Exercise 2.20

(require "helpers.rkt")

(define (my-filter pred l)
  (if (null? l)
    '()
    (if (pred (car l))
      (cons (car l) (my-filter pred (cdr l)))
      (my-filter pred (cdr l)))))

(define (same-parity x . y)
  (if (even? x)
    (cons x (my-filter even? y))
    (cons x (my-filter odd? y))))


;; Tests
(equal-lists? (list 2)
              (same-parity 2))
(equal-lists? (list 2)
              (same-parity 2 3))
(equal-lists? (list 2 4)
              (same-parity 2 3 4 5))
