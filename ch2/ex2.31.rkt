#lang racket
;; Exercise 2.31

(require "helpers.rkt")

(define (tree-map function tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (tree-map function sub-tree)
           (function sub-tree)))
       tree))

(define (square-tree tree)
  (tree-map square tree))

;; Test
(square-tree
           (list 1
                 (list 2 (list 3 4) 5)
                 (list 6 7)))
