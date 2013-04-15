#lang racket
;; Exercise 2.59

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((equal? (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) (cdr set2))))
        (else (union-set (cdr set1) (cdr set2)))))

;; Tests
(equal? (union-set '(1) '())
        '(1))
(equal? (union-set '(1) '(1))
        '(1))
(equal? (union-set '(2) '(2))
        '(2))
(equal? (union-set '(2, 3) '(2))
        '(2, 3))
