#lang racket
;; Exercise 2.34

(require "helpers.rkt")

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
                (+ this-coeff
                   (* x higher-terms)))
              0
              coefficient-sequence))

(= (let ((x 2))
     (+ (* 1 (expt x 0))
        (* 3 (expt x 1))
        (* 0 (expt x 2))
        (* 5 (expt x 3))
        (* 0 (expt x 4))
        (* 1 (expt x 5))))
   (horner-eval 2 (list 1 3 0 5 0 1)))
