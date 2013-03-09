#lang racket
; Exercise 1.8

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (cube-root x)
  (define (cube-root-iter guess old-guess x)
    (if (good-enough? guess old-guess x)
      guess
      (cube-root-iter (improve guess x) guess x)))
  (define (good-enough? guess old-guess x)
    (< (abs (- guess old-guess))
       (/ guess 1000)))
  (define (improve guess x)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))

  (cube-root-iter 1.0 100.0 x))


; Test
(define (test-cube-root-within-tolerance test-val tolerance)
  (< (abs (- (cube-root (cube test-val))
             test-val))
     tolerance))

(test-cube-root-within-tolerance 3 0.001)
(test-cube-root-within-tolerance 50 0.001)
(test-cube-root-within-tolerance 0.01 0.000001)
