#lang racket
;; Exercise 2.18

(define (reverse l)
  (define (reverse-iter in-list out-list)
    (if (null? in-list)
      out-list
      (reverse-iter (cdr in-list) (cons (car in-list) out-list))))
  (reverse-iter l '()))

;; Tests
(null?  (reverse '()))

(reverse (list 1 4 9 16 25))
