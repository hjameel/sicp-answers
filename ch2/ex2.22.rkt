#lang racket
;; Exercise 2.22

(require "helpers.rkt")

;; The first attempt at an iterative process
;; =========================================

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things) 
            (cons (square (car things))
                  answer))))
  (iter items '()))

(square-list (list 1 2 3))
;; Returns '(9 4 1)

;; This procedure maintains an answer list to which it conses a new value on
;; every iteration. The cons statement adds this new item to the front of the
;; list, so we end up with reversing the input.


;; The second attempt
;; =========================================

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons answer
                  (square (car things))))))
  (iter items '()))

(square-list2 (list 1 2 3))
;; Returns '(((() . 1) . 4) . 9)

;; In this procedure, the arguments to the cons statement have been swapped
;; around. The first argument to cons is the list 'answer', the second is a
;; number. On every iteration we therefore create a new pair with the current
;; answer list on the left and a number on the right, making the nested
;; structure above.
