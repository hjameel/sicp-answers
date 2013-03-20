#lang racket
;; Exercise 2.40

(require "helpers.rkt")

;; Definitions
(define (make-pair-sum pair)
  (let ((i (car pair))
        (j (cadr pair)))
    (list i
          j
          (+ i j))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

;; Solutions
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

;; Test
(unique-pairs 5)
(prime-sum-pairs 5)
