#lang racket
;; Exercise 2.54

(define (equal? a b)
  (eq? a b))

;; Tests
(equal? 1 1)
