#lang racket
;; Exercise 2.8

;; Definitions:
(define (make-interval a b) (cons a b))
(define upper-bound cdr)
(define lower-bound car)
(define (interval-equals a b)
  (and (= (upper-bound a) (upper-bound b))
       (= (lower-bound a) (lower-bound b))))

;; Solution:
;; For positive and negative numbers, we can get the lower bound by subtractng
;; the upper bound of the second operand from the lower bound of the first
;; operand.
;;
;; To get the upper bound we subtract the lower bound of the 2nd operand from
;; the upper bound of the first operand.

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;; Tests:
(interval-equals (sub-interval (make-interval 3 4)
                               (make-interval 1 2))
                 (make-interval 1 3))
(interval-equals (sub-interval (make-interval -4 -3)
                               (make-interval -6 -5))
                 (make-interval 1 3))
