#lang racket
;; Exercise 2.27

(define (deep-reverse l)
  (define (deep-reverse-iter in-list out-list)
    (cond ((null? in-list) out-list)
          ((not (pair? in-list)) in-list)
          (else (deep-reverse-iter (cdr in-list)
                                   (cons (deep-reverse-iter (car in-list) '())
                                         out-list)))))
  (deep-reverse-iter l '()))

(deep-reverse '(1 4 9 (3 2 1) 16 25))
