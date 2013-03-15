#lang racket
;; Exercise 2.3

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

;; Representation 1
;; Size of the rectangle given by it's length and width, position given by a
;; point.
(define (make-rectangle position len width)
  (cons position (cons len width)))

(define rectangle-position car)
(define rectangle-length cadr)
(define rectangle-width cddr)

;; Representation 2
;; Defined in terms of the bottom left and top right points.
(define (make-rectangle2 bottom-left top-right)
  (cons bottom-left top-right))

(define rectangle2-position car)
(define (rectangle2-length rect)
  (- (y-point (cdr rect))
     (y-point (car rect))))
(define (rectangle2-width rect)
  (- (x-point (cdr rect))
     (x-point (car rect))))

;; Perimeter (with parameters for the different rectangle implementations)
(define (rect-perimeter rect lenfn widthfn)
  (+ (* 2 (lenfn rect))
     (* 2 (widthfn rect))))

;; Area (with parameters for the different rectangle implementations)
(define (rect-area rect lenfn widthfn)
  (* (lenfn rect)
     (widthfn rect)))

;; Tests
;; Rectangle representation 1
(equal-points? (make-point 1 2)
               (rectangle-position (make-rectangle (make-point 1 2)
                                                   0
                                                   0)))
(= 1
   (rectangle-length (make-rectangle (make-point 0 0)
                                     1
                                     0)))
(= 1
   (rectangle-width (make-rectangle (make-point 0 0)
                                    0
                                    1)))
(= 10
   (rect-perimeter (make-rectangle (make-point 0 0)
                                   2
                                   3)
                   rectangle-length
                   rectangle-width))
(= 10
   (rect-area (make-rectangle (make-point 0 0)
                              2
                              5)
              rectangle-length
              rectangle-width))


;; Rectangle representation 2
(equal-points? (make-point 1 2)
               (rectangle2-position (make-rectangle2 (make-point 1 2)
                                                     (make-point 3 3))))
(= 1
   (rectangle2-length (make-rectangle2 (make-point 0 0)
                                       (make-point 10 1))))
(= 1
   (rectangle2-width (make-rectangle2 (make-point 0 0)
                                      (make-point 1 10))))
(= 10
   (rect-perimeter (make-rectangle2 (make-point 0 0)
                                    (make-point 2 3))
                   rectangle2-length
                   rectangle2-width))
(= 10
   (rect-area (make-rectangle2 (make-point 0 0)
                               (make-point 2 5))
              rectangle2-length
              rectangle2-width))
