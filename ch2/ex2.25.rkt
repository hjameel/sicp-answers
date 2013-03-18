#lang racket
;; Exercise 2.25

(define list1 '(1 3 (5 7) 9))
;; 7 given by:
(car (cdr (car (cdr (cdr list1)))))
;; or
(cadr (caddr list1))


(define list2 '((7)))
;; 7 given by:
(car (car list2))
;; or
(caar list2)


(define list3 '(1 (2 (3 (4 (5 (6 7)))))))
;; 7 given by:
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr list3))))))))))))
;; or
(cadr (cadr (cadr (cadr (cadr (cadr list3))))))
