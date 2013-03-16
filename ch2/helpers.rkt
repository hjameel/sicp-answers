#lang racket

(define (equal-lists? list1 list2)
  (cond ((and (null? list1) (null? list2)) #t)
         ((or (null? list1) (null? list2)) #f)
         ((= (car list1) (car list2)) (equal-lists? (cdr list1) (cdr list2)))
         (else #f)))

(define (square x)
  (* x x))

;; Provide
(provide equal-lists? square)
