#lang racket
;; Exercise 2.2

;; Data abstraction functions
;; Segments
(define (make-segment start end)
  (cons start end))
(define start-segment car)
(define end-segment cdr)

;; Points
(define (make-point x y)
  (cons x y))
(define x-point car)
(define y-point cdr)

;; Helper functions
(define (equal-points? p1 p2)
  (and (= (x-point p1) (x-point p2))
       (= (y-point p1) (y-point p2))))

;; Mid point function
(define (midpoint-segment segment)
  (let ((a (start-segment segment))
        (b (end-segment segment)))
    (make-point (average (x-point a)
                         (x-point b))
                (average (y-point a)
                         (y-point b)))))

(define (average x y)
  (/ (+ x y)
     2))

;; Tests
(equal-points? (midpoint-segment (make-segment (make-point 10 10)
                                               (make-point 20 20)))
               (make-point 15 15))
