#lang racket
;; Exercise 2.19

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1))

;; Solution
(define first-denomination car)
(define except-first-denomination cdr)
(define no-more? null?)

;; Tests
(= 292
   (cc 100 us-coins))
(= 11
   (cc 10 uk-coins))
