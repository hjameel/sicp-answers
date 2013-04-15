#lang racket
;; Exercise 2.59

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else
         (union-set (cdr set1) (adjoin-set (car set1) set2)))))


;; Tests
(equal? (union-set '(1) '())
        '(1))
(equal? (union-set '(1) '(1))
        '(1))
(equal? (union-set '(2) '(2))
        '(2))
(equal? (union-set '(2 3) '(2))
        '(3 2))
(equal? (union-set '(1) '(2))
        '(1 2))
