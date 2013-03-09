#lang racket
; Exercise 1.8

(define (cube-root x)
  (cube-root-iter 1.0 100.0 x))

(define (cube-root-iter guess old-guess x)
  (if (good-enough? guess old-guess x)
    guess
    (cube-root-iter (improve guess x) guess x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (square x)
  (* x x))

(define (good-enough? guess old-guess x)
  (< (abs (- guess old-guess))
     (/ guess 1000)))

; Test
(< (abs (- (cube-root 27) 3))
   0.001)
(< (abs (- (cube-root (* 50 50 50)) 50))
   0.001)
(< (abs (- (cube-root (* 0.01 0.01 0.01)) 0.01))
   0.000001)
