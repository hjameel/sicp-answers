#lang racket
;; Exercise 2.21

(require "helpers.rkt")

;; Definition 1
(define (square-list1 items)
  (if (null? items)
    '()
    (cons (square (car items)) (square-list1 (cdr items)))))

;; Definition 2
(define (square-list2 items)
  (map square items))

;; Tests
(define alist (list 1 4 5 6 8 39))
(equal-lists? (square-list1 alist)
              (square-list2 alist))
