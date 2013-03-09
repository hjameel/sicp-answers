#lang racket
;; Exercise 1.7

(define (sqrt x)
  (sqrt-iter 1.0 100.0 x))

(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess x)
    guess
    (sqrt-iter (improve guess x)
               guess
               x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess old-guess x)
  (< (abs (- guess old-guess))
     (/ guess 100)))

(define (square x)
  (* x x))

;; Test
(< (abs (- (sqrt 9) 3))
   0.001)
