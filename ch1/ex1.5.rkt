#lang racket
;; Exercise 1.5

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

;; Applicative-order evaluation:
;; We evaluate the arguments to "test" first, then apply the procedure.
;; i.e. in

;;  (test 0 (p))

;; (p) is evaluated to (p), which is evaluated to (p) etc. forever.

;; Normal-order evaluation:
;; We fully expand the expression, giving:
(if (= 0 0)
  0
  (p))

;; which evaluates to 0.
