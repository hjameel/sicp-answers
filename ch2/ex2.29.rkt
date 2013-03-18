#lang racket
;; Exercise 2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; A:
;; ==========

;; Mobile selectors
(define left-branch car)
(define right-branch cadr)

;; Branch selectors
(define branch-length car)
(define branch-structure cadr)

;; B:
;; ==========
(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (pair? structure)
      (total-weight structure)
      structure)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;; Tests
(define small-mobile (make-mobile (make-branch 1 1)
                                  (make-branch 1 2)))
(define small-mobile-weight 3)

(= small-mobile-weight
   (total-weight small-mobile))
(= (* 2 small-mobile-weight)
   (total-weight (make-mobile (make-branch 1 small-mobile)
                              (make-branch 1 small-mobile))))

;; C:
;; ==========
(define (balanced-branch? branch)
  (if (pair? (branch-structure branch))
    (balanced? (branch-structure branch))
    #t))

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (* (branch-length left) (branch-weight left))
            (* (branch-length right) (branch-weight right)))
         (and (balanced-branch? left)
              (balanced-branch? right)))))

;; Tests
(define small-mobile-torque 3)
(define balanced-mobile (make-mobile (make-branch 1 2)
                                     (make-branch 2 1)))

(not (balanced? small-mobile))
(balanced? balanced-mobile)

;; D:
;; ==========

;; If we change the structure of the mobiles and branches to the below,
(define (make-mobile2 left right)
  (cons left right))
(define (make-branch2 length structure)
  (cons length structure))
;; we only need to change the selectors to fix the code.
;; i.e.
;; left-branch, right-branch, branch-length and branch-structure.
