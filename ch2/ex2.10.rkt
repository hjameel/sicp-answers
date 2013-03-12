#lang racket
;; Exercise 2.10

;; Definitions:
(define (make-interval a b) (cons a b))
(define upper-bound cdr)
(define lower-bound car)
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;; Solution:
(define (div-interval x y)
  (cond ((and (>= (upper-bound y) 0)
              (<= (lower-bound y) 0))
         (error "Division by an interval which spans 0.")))
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

;; Test
(with-handlers ([exn:fail? (lambda (exn) "Hit the first error.")])
               (div-interval (make-interval 10 9)
                             (make-interval -1 1)))
(with-handlers ([exn:fail? (lambda (exn) "Hit the second error.")])
               (div-interval (make-interval 10 9)
                             (make-interval 0 1)))
(with-handlers ([exn:fail? (lambda (exn) "Hit the third error.")])
               (div-interval (make-interval 10 9)
                             (make-interval -1 0)))
(with-handlers ([exn:fail? (lambda (exn) "Hit the fourth error.")])
               (div-interval (make-interval 10 9)
                             (make-interval 0 0)))
(with-handlers ([exn:fail? (lambda (exn) "Shouldn't see an error here.")])
               (div-interval (make-interval 10 9)
                             (make-interval 2 1)))
