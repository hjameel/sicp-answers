#lang racket
;; Exercise 2.59

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((equal? (car set1) (car set2))
         (cons (car set1)
               (union-set (cdr set1) (cdr set2))))
        (else
          (cons (car set1)
                (cons (car set2)
                      (union-set (cdr set1) (cdr set2)))))))

(define (union-set-iter set1 set2)
  (define (union-set-agg set1 set2 agg)
    (cond ((null? set1)  (append set2 agg))
          ((null? set2)  (append set1 agg))
          ((equal? (car set1) (car set2))
           (union-set-agg
             (cdr set1)
             (cdr set2)
             (cons (car set1) agg)))
          (else
           (union-set-agg
             (cdr set1)
             (cdr set2)
             (cons (car set1) (cons (car set2) agg))))))

  (union-set-agg set1 set2 '()))


;; Tests
;; Recursive solution
(equal? (union-set '(1) '())
        '(1))
(equal? (union-set '(1) '(1))
        '(1))
(equal? (union-set '(2) '(2))
        '(2))
(equal? (union-set '(2 3) '(2))
        '(2 3))
(equal? (union-set '(1) '(2))
        '(1 2))

;; Iterative solution
(equal? (union-set-iter '(1) '())
        '(1))
(equal? (union-set-iter '(1) '(1))
        '(1))
(equal? (union-set-iter '(2) '(2))
        '(2))
(equal? (union-set-iter '(2 3) '(2))
        '(3 2))
(equal? (union-set-iter '(1) '(2))
        '(1 2))
