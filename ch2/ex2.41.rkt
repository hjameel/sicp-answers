#lang racket
;; Exercise 2.41

(require "helpers.rkt")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap (lambda (ij)
             (map (lambda (k) (list (car ij) (cadr ij) k))
                  (enumerate-interval 1 (- (cadr ij) 1))))
           (unique-pairs n)))

(define (sum-triples s)
  (filter (lambda (x)
            (= s
               (accumulate + 0 x)))
          (unique-triples s)))

;; Tests
(sum-triples 9)
